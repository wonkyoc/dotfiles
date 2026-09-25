#!/usr/bin/env python3
"""Language-coach ledger: add entries, count mistakes, keep word history, flag recurring patterns.

The ledger (language-study.jsonl) is the only source of truth; counts, word history
and the study page (language-study.md) are derived from it on every run.

Ledger directory: $LANGUAGE_COACH_DIR if set, else <dotfiles>/learning, found by
resolving this script through its symlink (skills/prompt-language-coach/scripts/).

Usage:
  coach.py add [FILE]      upsert one entry (JSON object from FILE or stdin), re-render, print flags
  coach.py check           validate the ledger and re-render the study page
  coach.py stats [--days N]  totals and recurring patterns (optionally last N days only)
  coach.py word TEXT       history of one word or phrase
  coach.py path            print the ledger directory
"""
import datetime as dt
import json
import os
import sys
from collections import Counter, defaultdict
from pathlib import Path

HERE = Path(__file__).resolve()
PATTERNS = {k: v for k, v in json.loads((HERE.parents[1] / 'references/patterns.json').read_text()).items()
            if not k.startswith('_')}
RECURRING, PERSISTENT = 2, 4          # distinct messages showing the same pattern
CATEGORIES = ('grammar', 'expression')


def ledger_dir():
    env = os.environ.get('LANGUAGE_COACH_DIR')
    return Path(env).expanduser() if env else HERE.parents[3] / 'learning'


def ledger_path():
    return ledger_dir() / 'language-study.jsonl'


def load():
    p = ledger_path()
    if not p.exists():
        return []
    return [json.loads(l) for l in p.read_text().splitlines() if l.strip()]


def validate(e, strict_patterns=True):
    for k in ('id', 'date', 'original', 'corrected', 'errors'):
        if k not in e:
            raise ValueError(f"{e.get('id', '?')}: missing field {k}")
    dt.date.fromisoformat(e['date'])
    for x in e['errors']:
        if x.get('category') not in CATEGORIES:
            raise ValueError(f"{e['id']}: category must be grammar or expression")
        if type(x.get('sentence')) is not int or x['sentence'] < 1:
            raise ValueError(f"{e['id']}: sentence must be a positive integer")
        for k in ('original', 'correction', 'reason'):
            if k not in x:
                raise ValueError(f"{e['id']}: error missing {k}")
        pat = x.get('pattern')
        if strict_patterns and pat not in PATTERNS:
            raise ValueError(f"{e['id']}: unknown pattern {pat!r}; use one of {', '.join(PATTERNS)} "
                             "or add it to references/patterns.json")
        for w in x.get('words', []):
            if not isinstance(w, dict) or 'to' not in w:
                raise ValueError(f"{e['id']}: words items look like {{\"from\": \"comb\", \"to\": \"combine\"}}")


def save(entries):
    ids = Counter(e['id'] for e in entries)
    dup = [i for i, n in ids.items() if n > 1]
    if dup:
        raise ValueError('Duplicate message id: ' + ', '.join(dup))
    p = ledger_path()
    p.parent.mkdir(parents=True, exist_ok=True)
    tmp = p.with_suffix('.tmp')
    tmp.write_text(''.join(json.dumps(e, ensure_ascii=False) + '\n' for e in entries))
    tmp.replace(p)


# ---------- derived views ----------

def norm(s):
    return ' '.join(s.lower().strip(' .,;:!?"\'“”‘’').split())


def analyze(entries):
    pats = defaultdict(lambda: {'issues': 0, 'msgs': [], 'examples': [], 'cats': Counter()})
    words = defaultdict(lambda: {'issues': 0, 'msgs': [], 'from': Counter(), 'examples': [], 'display': ''})
    for e in entries:
        for x in e['errors']:
            p = pats[x.get('pattern', 'untagged')]
            p['issues'] += 1
            p['cats'][x['category']] += 1
            if not p['msgs'] or p['msgs'][-1][0] != e['id']:
                p['msgs'].append((e['id'], e['date']))
            p['examples'].append((e['date'], x['original'], x['correction']))
            for w in x.get('words', []):
                h = words[norm(w['to'])]
                h['issues'] += 1
                h['display'] = h['display'] or w['to'].strip()
                if not h['msgs'] or h['msgs'][-1][0] != e['id']:
                    h['msgs'].append((e['id'], e['date']))
                if w.get('from'):
                    h['from'][w['from'].strip()] += 1
                h['examples'].append((e['date'], x['original'], x['correction']))
    return pats, words


def flag(n_msgs):
    return 'persistent' if n_msgs >= PERSISTENT else 'recurring' if n_msgs >= RECURRING else ''


def totals(entries):
    c = Counter(x['category'] for e in entries for x in e['errors'])
    return {
        'reviewed': len(entries),
        'with_issues': sum(bool(e['errors']) for e in entries),
        'sentences': sum(len({x['sentence'] for x in e['errors']}) for e in entries),
        'grammar': c['grammar'], 'expression': c['expression'], 'total': sum(c.values()),
    }


def label(pid):
    return PATTERNS.get(pid, {}).get('label', pid)


def render(entries):
    t = totals(entries)
    pats, words = analyze(entries)
    L = ['# English self-study', '',
         'Tracking began with the 2026-09-23 request to record sentences; earlier conversations are not included. '
         'Entries come from every repository and assistant (Claude, ChatGPT) that uses the shared `prompt-language-coach` skill. '
         'Optional style improvements are not mistakes. Totals describe reviewed messages, not overall proficiency.', '',
         f'Generated by `coach.py` from [the sentence ledger](language-study.jsonl) on {dt.date.today()}.', '',
         '## Mistake counts', '',
         '| Reviewed prompts | Prompts with issues | Sentences with issues | Grammar issues | Expression issues | Total issues |',
         '| --- | --- | --- | --- | --- | --- |',
         f"| {t['reviewed']} | {t['with_issues']} | {t['sentences']} | {t['grammar']} | {t['expression']} | {t['total']} |", '']

    weeks = defaultdict(lambda: [0, 0])
    for e in entries:
        y, w, _ = dt.date.fromisoformat(e['date']).isocalendar()
        weeks[f'{y}-W{w:02d}'][0] += 1
        weeks[f'{y}-W{w:02d}'][1] += len(e['errors'])
    L += ['### By week', '', '| Week | Prompts | Issues | Issues per prompt |', '| --- | --- | --- | --- |']
    for k in sorted(weeks):
        n, i = weeks[k]
        L.append(f'| {k} | {n} | {i} | {i / n:.2f} |')
    L.append('')

    L += ['## Recurring patterns', '',
          f'Flagged **recurring** at {RECURRING}+ prompts and **persistent** at {PERSISTENT}+ prompts. '
          'Study these first.', '',
          '| Flag | Pattern | Issues | Prompts | First seen | Last seen | Recent example |',
          '| --- | --- | --- | --- | --- | --- | --- |']
    for pid, p in sorted(pats.items(), key=lambda kv: (-len(kv[1]['msgs']), -kv[1]['issues'], kv[0])):
        d, o, c = p['examples'][-1]
        f = flag(len(p['msgs']))
        L.append(f"| {('**' + f + '**') if f else ''} | {label(pid)} (`{pid}`) | {p['issues']} | {len(p['msgs'])} | "
                 f"{p['msgs'][0][1]} | {p['msgs'][-1][1]} | “{o}” → “{c}” |")
    L.append('')

    L += ['## Word history', '',
          'Words and phrases you have been corrected toward, with what you wrote instead. '
          'Articles and punctuation are counted under patterns, not here.', '',
          '| Use | Instead of | Times | Prompts | First seen | Last seen |', '| --- | --- | --- | --- | --- | --- |']
    for w, h in sorted(words.items(), key=lambda kv: (-kv[1]['issues'], kv[1]['msgs'][0][1], kv[0])):
        frm = ', '.join(f'“{k}”' for k, _ in h['from'].most_common()) or '(omitted)'
        rep = ' 🔁' if len(h['msgs']) >= RECURRING else ''
        L.append(f"| **{h['display']}**{rep} | {frm} | {h['issues']} | {len(h['msgs'])} | {h['msgs'][0][1]} | {h['msgs'][-1][1]} |")
    L.append('')

    L += ['## Prompt log', '']
    for e in entries:
        where = f" · {e['project']}" if e.get('project') else ''
        L += [f"### {e['date']}: {e['id']}{where}", '', '**Your original wording**', '']
        L += ['> ' + line for line in e['original'].splitlines()]
        L += ['', '**Suggested version**', '', e['corrected'], '', '**What to study**', '']
        if not e['errors']:
            L.append('No counted issues.')
        for x in e['errors']:
            tag = f" `{x['pattern']}`" if x.get('pattern') else ''
            L.append(f"- **{x['category'].capitalize()}**{tag}, sentence {x['sentence']}: "
                     f"“{x['original']}” → “{x['correction']}”. {x['reason']}")
        if e.get('style_notes'):
            L += ['', '**Optional style notes (not counted)**', '']
            L += ['- ' + n for n in e['style_notes']]
        L.append('')
    return '\n'.join(L)


def write_page(entries):
    out = ledger_dir() / 'language-study.md'
    out.write_text(render(entries) + '\n')
    return out


# ---------- commands ----------

def cmd_add(src):
    e = json.loads(Path(src).read_text() if src else sys.stdin.read())
    validate(e)
    entries = load()
    action = 'added'
    for i, old in enumerate(entries):
        if old['id'] == e['id']:
            entries[i] = e
            action = 'updated (not counted twice)'
            break
    else:
        entries.append(e)
    save(entries)
    page = write_page(entries)
    pats, words = analyze(entries)
    print(f"{action}: {e['id']} -> {ledger_path()}")
    print(f"page: {page}")
    for x in e['errors']:
        p = pats[x['pattern']]
        n = len(p['msgs'])
        f = flag(n)
        prev = [m for m in p['msgs'] if m[0] != e['id']]
        line = f"- {x['pattern']} ({label(x['pattern'])}): {p['issues']} issues in {n} prompts"
        if f:
            line += f" -> FLAG {f.upper()}; last before this: {prev[-1][1] if prev else 'n/a'}"
        print(line)
        for w in x.get('words', []):
            h = words[norm(w['to'])]
            if len(h['msgs']) >= RECURRING:
                before = ', '.join(f'“{k}”' for k in h['from']) or 'omitted'
                print(f"  word “{h['display']}” corrected in {len(h['msgs'])} prompts (you wrote {before})")
    t = totals(entries)
    print(f"totals: {t['reviewed']} prompts, {t['total']} issues "
          f"({t['grammar']} grammar, {t['expression']} expression)")


def cmd_check():
    entries = load()
    untagged = 0
    for e in entries:
        validate(e, strict_patterns=False)
        untagged += sum('pattern' not in x or x['pattern'] not in PATTERNS for x in e['errors'])
    save(entries)
    print(f"ok: {len(entries)} prompts; page {write_page(entries)}")
    if untagged:
        print(f"warning: {untagged} errors lack a known pattern id")


def cmd_stats(days=None):
    entries = load()
    if days:
        cut = dt.date.today() - dt.timedelta(days=days)
        entries = [e for e in entries if dt.date.fromisoformat(e['date']) >= cut]
    t = totals(entries)
    print(json.dumps(t))
    pats, _ = analyze(entries)
    for pid, p in sorted(pats.items(), key=lambda kv: -len(kv[1]['msgs'])):
        print(f"{flag(len(p['msgs'])) or '-':10} {pid:24} issues={p['issues']:<3} prompts={len(p['msgs']):<3} last={p['msgs'][-1][1]}")


def cmd_word(text):
    _, words = analyze(load())
    key = norm(text)
    hits = {w: h for w, h in words.items() if key in w or any(key in norm(k) for k in h['from'])}
    if not hits:
        print(f'no history for “{key}”')
    for w, h in hits.items():
        print(f"{w}: {h['issues']} corrections in {len(h['msgs'])} prompts; you wrote {dict(h['from'])}")
        for d, o, c in h['examples']:
            print(f"  {d}: “{o}” → “{c}”")


if __name__ == '__main__':
    a = sys.argv[1:]
    cmd = a[0] if a else 'check'
    if cmd == 'add':
        cmd_add(a[1] if len(a) > 1 else None)
    elif cmd == 'check':
        cmd_check()
    elif cmd == 'stats':
        cmd_stats(int(a[2]) if len(a) > 2 and a[1] == '--days' else None)
    elif cmd == 'word' and len(a) > 1:
        cmd_word(' '.join(a[1:]))
    elif cmd == 'path':
        print(ledger_dir())
    else:
        print(__doc__)
        sys.exit(2)
