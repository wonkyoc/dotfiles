#!/usr/bin/env python3
"""Unwrap hard-wrapped Markdown: join each paragraph / list item into one logical line.

Usage: unwrap_md.py FILE [FILE...]     (rewrites in place; prints a per-file summary)

Preserved untouched: code fences (``` / ~~~), indented code blocks, tables, headings,
horizontal rules, blank lines, and YAML frontmatter. List items absorb their indented
continuation lines; plain paragraphs absorb theirs.
"""
import re
import sys

FENCE = re.compile(r"^\s*(```|~~~)")
LIST_ITEM = re.compile(r"^\s*([-*+]|\d+[.)])\s+")
HEADING = re.compile(r"^\s{0,3}#")
HRULE = re.compile(r"^\s{0,3}((-\s*){3,}|(\*\s*){3,}|(_\s*){3,})$")
TABLE = re.compile(r"^\s*\|")
BLOCKQUOTE = re.compile(r"^\s*>")


def unwrap(text: str) -> str:
    lines = text.split("\n")
    out: list[str] = []
    buf: list[str] = []
    in_fence = False
    i = 0

    # YAML frontmatter passes through verbatim.
    if lines and lines[0].strip() == "---":
        out.append(lines[0])
        i = 1
        while i < len(lines):
            out.append(lines[i])
            if lines[i].strip() == "---":
                i += 1
                break
            i += 1

    def flush():
        if buf:
            out.append(" ".join(buf))
            buf.clear()

    while i < len(lines):
        line = lines[i]
        stripped = line.strip()

        if FENCE.match(line):
            flush()
            in_fence = not in_fence
            out.append(line)
        elif in_fence:
            out.append(line)
        elif not stripped:
            flush()
            out.append(line)
        elif HRULE.match(line) or HEADING.match(line) or TABLE.match(line) or BLOCKQUOTE.match(line):
            flush()
            out.append(line)
        elif LIST_ITEM.match(line):
            flush()
            buf.append(line.rstrip())
        elif not buf and line.startswith("    "):
            # Indented code block (only when not continuing a paragraph/item).
            out.append(line)
        elif buf:
            buf.append(stripped)
        else:
            buf.append(line.rstrip())
        i += 1

    flush()
    return "\n".join(out)


def main() -> int:
    if len(sys.argv) < 2:
        print(__doc__.strip(), file=sys.stderr)
        return 1
    for path in sys.argv[1:]:
        with open(path, encoding="utf-8") as f:
            original = f.read()
        result = unwrap(original)
        if result != original:
            with open(path, "w", encoding="utf-8") as f:
                f.write(result)
        print(f"{path}: {len(original.splitlines())} -> {len(result.splitlines())} lines")
    return 0


if __name__ == "__main__":
    sys.exit(main())
