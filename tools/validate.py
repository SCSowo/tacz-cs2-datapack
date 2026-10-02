#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
tacz-cs2-datapack 数据包静态校验。

用法：
    python tools/validate.py [数据包目录]
默认目录：仓库根目录（pack.mcmeta 所在处，本脚本是其下 tools/ 里的文件）

检查项：
  1. 非法转义序列 —— Minecraft 命令里的引号字符串只允许 \\ 和 \\"，
     写成 \\n 会让整个函数加载失败（表现为运行时报"未知函数"）。
  2. 字面换行文本 —— 书页里残留的 \\\\n 不会报错，但会原样显示成 "\\n\\n"。
  3. 函数引用悬空 —— function cs2d:xxx 没有对应 .mcfunction 文件。
  4. 书页 JSON —— 成书 pages 里每一页是否都能被 JSON 解析。
  5. 计分板引用 —— 用到但未在 load.mcfunction 里定义的 cs2d.* 计分板。
  6. 文件编码 —— 必须 UTF-8 无 BOM，否则中文全乱码。
  7. 资源位置合法性 —— 路径只允许 a-z 0-9 _ . -，大写或空格会导致整个包被忽略。
  8. 一行塞了两条命令 —— 形如 "…}}}]kill @e[…]"（] 后紧跟字母）。
     整行解析失败 → 整个函数加载失败 → 运行时表现成"这个命令没反应"，
     典型后果：回合结束不了、强制停止失效。
"""
import json
import os
import re
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
REPO = os.path.dirname(HERE)          # tools/ 的上一级 = 仓库根


def find_pack_root(argv):
    if len(argv) > 1:
        return argv[1]
    # 本仓库的布局：仓库根就是数据包（pack.mcmeta + data/ 直接在根）
    if os.path.isfile(os.path.join(REPO, "pack.mcmeta")):
        return REPO
    # 兼容子目录布局：<仓库根>/cs2_demo/
    p = os.path.join(REPO, "cs2_demo")
    return p if os.path.isdir(p) else REPO


ROOT = find_pack_root(sys.argv)
FUNC_ROOT = os.path.join(ROOT, "data")

problems = []


def report(level, path, msg):
    problems.append((level, path, msg))


# 收集所有 mcfunction
func_files = []
for dirpath, dirnames, filenames in os.walk(FUNC_ROOT):
    for f in filenames:
        if f.endswith(".mcfunction"):
            func_files.append(os.path.join(dirpath, f))

# ---------- 6. 编码 ----------
for p in func_files:
    raw = open(p, "rb").read()
    if raw[:3] == b"\xef\xbb\xbf":
        report("错误", p, "文件带 UTF-8 BOM，Minecraft 会把首行命令吃掉")
    try:
        raw.decode("utf-8")
    except UnicodeDecodeError as e:
        report("错误", p, "不是合法 UTF-8：%s" % e)

# ---------- 7. 资源位置合法性 ----------
for dirpath, dirnames, filenames in os.walk(os.path.join(ROOT, "data")):
    for d in dirnames:
        if not re.fullmatch(r"[a-z0-9_.-]+", d):
            report("错误", os.path.join(dirpath, d), "目录名含非法字符（只允许 a-z 0-9 _ . -）")
    for f in filenames:
        stem = f.rsplit(".", 1)[0] if "." in f else f
        if not re.fullmatch(r"[a-z0-9_.-]+", stem):
            report("错误", os.path.join(dirpath, f), "文件名含非法字符（只允许 a-z 0-9 _ . -）")

# ---------- 1 & 2. 转义 ----------
for p in func_files:
    text = open(p, encoding="utf-8").read()
    for m in re.finditer(r"\\(.)", text):
        c = m.group(1)
        if c not in ('"', "\\"):
            line = text.count("\n", 0, m.start()) + 1
            report("错误", "%s:%d" % (p, line),
                   "非法转义序列 \\%s —— Minecraft 引号字符串只允许 \\\\ 和 \\\"" % c)
    # 字面换行文本：\\\\n 在文件里写作两个反斜杠 + n
    if text.count("\\\\n"):
        report("警告", p, "残留字面换行文本 \\\\n，会原样显示出来")

# ---------- 3. 函数引用 ----------
refs = {}
for p in func_files:
    for r in re.findall(r"(?:^|\s)function\s+([a-z0-9_.-]+:[a-z0-9_./]+)",
                        open(p, encoding="utf-8").read()):
        refs.setdefault(r, set()).add(p)
for r, srcs in sorted(refs.items()):
    ns, path = r.split(":", 1)
    fp = os.path.join(ROOT, "data", ns, "functions", path.replace("/", os.sep) + ".mcfunction")
    if not os.path.exists(fp):
        report("错误", sorted(srcs)[0], "函数引用悬空：%s（文件不存在）" % r)

# ---------- 3.5 1.20.1 语法黑名单 / 结构陷阱 ----------
# 这三条都来自真实日志里的 Failed to load function，静态校验能提前抓到：
#   a) execute if|unless items   → 1.20.2 才加，1.20.1 报 "Incorrect argument for command"
#   b) attribute @a / @e         → 只允许单个实体，报 "Only one entity is allowed"
#   c) 成书页的单引号不成对      → "Unclosed quoted string"，整行（整个函数）报废
for p in func_files:
    text = open(p, encoding="utf-8").read()
    for i, l in enumerate(text.splitlines(), 1):
        if l.lstrip().startswith("#"):   # 注释里提到这些语法不算数
            continue
        if re.search(r"\b(if|unless)\s+items\b", l):
            report("错误", "%s:%d" % (p, i),
                   "execute if|unless items 是 1.20.2 语法，1.20.1 没有 → Incorrect argument")
        if re.match(r"\s*attribute\s+@[ae]\b", l):
            report("错误", "%s:%d" % (p, i),
                   "attribute 只允许单个实体 → 改成 execute as @a run attribute @s ...")
        if "pages:[" in l and l.count("'") % 2 == 1:
            report("错误", "%s:%d" % (p, i),
                   "成书单引号不成对（%d 个）→ Unclosed quoted string" % l.count("'"))

        # 一行塞了两条命令：] 后面紧跟字母（正常 NBT/选择器后面只会跟 , ] 空格 行尾）
        if "pages:[" not in l and re.search(r"\][A-Za-z]", l):
            report("错误", "%s:%d" % (p, i),
                   "一行里塞了两条命令（] 后紧跟字母）→ 该行解析失败，整个函数报废：%s"
                   % l.strip()[:60])

# ---------- 3.6 战利品表 ----------
# a) loot replace ... loot <ns:path> 引用的表必须存在
# b) 表里的 set_nbt tag 字符串（JSON 解码后 = NBT 源码）只能出现 \\ 和 \" 两种转义，
#    出现 \n 之类的会让整张表加载失败（和函数文件同一个坑）
LT_ROOT = os.path.join(ROOT, "data")
for p in func_files:
    for i, l in enumerate(open(p, encoding="utf-8").read().splitlines(), 1):
        if l.lstrip().startswith("#"):
            continue
        for r in re.findall(r"\bloot\s+([a-z0-9_.-]+:[a-z0-9_./]+)", l):
            ns, path = r.split(":", 1)
            fp = os.path.join(LT_ROOT, ns, "loot_tables", path.replace("/", os.sep) + ".json")
            if not os.path.exists(fp):
                report("错误", "%s:%d" % (p, i),
                       "战利品表引用悬空：%s（data/%s/loot_tables/%s.json 不存在）" % (r, ns, path))
for dirpath, dirnames, filenames in os.walk(LT_ROOT):
    if os.path.basename(dirpath) != "loot_tables":
        continue
    for fn in filenames:
        if not fn.endswith(".json"):
            continue
        fp = os.path.join(dirpath, fn)
        try:
            obj = json.loads(open(fp, encoding="utf-8").read())
        except Exception as e:
            report("错误", fp, "战利品表 JSON 解析失败：%s" % e)
            continue
        for pool in obj.get("pools", []):
            for ent in pool.get("entries", []):
                for fnc in ent.get("functions", []):
                    tag = fnc.get("tag")
                    if not isinstance(tag, str):
                        continue
                    bad = set(re.findall(r"\\(.)", tag)) - {"\\", '"'}
                    if bad:
                        report("错误", fp, "set_nbt 的 NBT 里有非法转义 %s —— 只允许 \\\\ 和 \\\""
                               % ("、".join("\\" + c for c in sorted(bad))))

# ---------- 4. 书页 JSON ----------
for p in func_files:
    text = open(p, encoding="utf-8").read()
    if "written_book" not in text:
        continue
    # 只有真正发书（带 pages）的命令才检查；clear / Inventory 判定里的 written_book 跳过
    if "pages:[" not in text:
        continue
    hits = list(re.finditer(r"pages:\[(.*?)\],title:", text, re.S))
    if not hits:
        report("错误", p, "成书结构异常：找不到 pages:[...],title: —— 单引号多半没闭合")
        continue
    for gm in hits:
        # 严格校验：按单引号切分后，偶数段必须是分隔符（空/逗号），奇数段必须是合法 JSON 数组。
        # 只做「找 '[...]' 再 parse」的话，最后一页少了收尾引号会被静默跳过——
        # 而实际后果是 Unclosed quoted string，整个函数加载失败。
        parts = gm.group(1).split("'")
        if len(parts) % 2 == 0:
            report("错误", p, "成书单引号不成对（%d 段）→ Unclosed quoted string" % len(parts))
            continue
        for k, seg in enumerate(parts):
            if k % 2 == 0:
                if seg not in ("", ","):
                    report("错误", p, "书页第 %d 段应为分隔符 , ，实际是 %r" % (k, seg[:30]))
            else:
                try:
                    json.loads(seg)
                except Exception as e:
                    report("错误", p, "第 %d 页 JSON 解析失败：%s" % (k // 2 + 1, e))

# ---------- 4b. 战利品表：set_nbt 的 tag 是 SNBT，单引号字符串内 \\" 非法 ----------
# 真实事故：写成 \\\" → Gson 解析后 SNBT 里是 \" → 单引号字符串内反斜杠触发转义、
# 后面跟 " 不匹配 → 报 Couldn't parse element loot_tables:cs2d:buy_t
lt_dir = os.path.join(ROOT, "data", "cs2d", "loot_tables")
if os.path.isdir(lt_dir):
    for fn in sorted(os.listdir(lt_dir)):
        if not fn.endswith(".json"):
            continue
        p = os.path.join(lt_dir, fn)
        try:
            j = json.load(open(p, encoding="utf-8"))
        except Exception as e:
            report("错误", p, "JSON 解析失败：%s" % e)
            continue
        for pool in j.get("pools", []):
            for ent in pool.get("entries", []):
                for fu in ent.get("functions", []):
                    tag = fu.get("tag")
                    if not isinstance(tag, str):
                        continue
                    if r'\"' in tag:
                        report("错误", p, "set_nbt 的 tag 含非法转义 \\\" —— SNBT 单引号字符串内"
                                        "反斜杠会触发转义，应写成纯 \"（文件里对应 \\\"）")

# ---------- 5. 计分板 ----------
load_fp = None
for p in func_files:
    if os.path.basename(p) == "load.mcfunction":
        load_fp = p
        break
if load_fp:
    defined = set(re.findall(r"objectives add ([a-zA-Z0-9_.]+)",
                             open(load_fp, encoding="utf-8").read()))
    # 只统计"真的当成计分板用"的场合，避免把实体标签 cs2d.fxT 之类误报
    pats = [
        r'"objective"\s*:\s*"(cs2d\.[a-zA-Z0-9_]+)"',   # JSON score 组件
        r'objectives\s+\w+\s+(cs2d\.[a-zA-Z0-9_]+)',     # scoreboard objectives add/remove
        r'scoreboard players \S+ \S+ (cs2d\.[a-zA-Z0-9_]+)',  # set/get/add/enable/operation 左侧
        r'(cs2d\.[a-zA-Z0-9_]+)\s*$',                    # operation 右侧 / get 结尾
    ]
    used = set()
    for p in func_files:
        t = open(p, encoding="utf-8").read()
        for pat in pats:
            used.update(re.findall(pat, t, re.M))
    # 实体标签（tag @s add cs2d.dead / Tags:["cs2d.newmap"]）不算计分板，剔除
    tagish = set()
    for p in func_files:
        t = open(p, encoding="utf-8").read()
        tagish.update(re.findall(r"tag\s+@\S+\s+(?:add|remove)\s+(cs2d\.[a-zA-Z0-9_]+)", t))
        tagish.update(re.findall(r'Tags:\[[^\]]*?"(cs2d\.[a-zA-Z0-9_]+)"', t))
        tagish.update(re.findall(r'tag=(cs2d\.[a-zA-Z0-9_]+)', t))
    for u in sorted(used - defined - tagish):
            report("警告", load_fp, "计分板 %s 被使用但 load 里没定义" % u)

# ---------- 输出 ----------
print("数据包目录：%s" % ROOT)
print("函数文件数：%d    函数引用数：%d" % (len(func_files), len(refs)))
print()
if not problems:
    print("全部检查通过，没有发现问题。")
else:
    errs = [x for x in problems if x[0] == "错误"]
    warns = [x for x in problems if x[0] == "警告"]
    for level, path, msg in errs + warns:
        print("[%s] %s" % (level, os.path.relpath(path, ROOT)))
        print("       %s" % msg)
    print()
    print("错误 %d 条，警告 %d 条" % (len(errs), len(warns)))
    sys.exit(1 if errs else 0)
