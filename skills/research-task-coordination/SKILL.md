---
name: research-task-coordination
description: Coordinate a research project's peer tasks (experiments, literature audits, writing) with bounded handoffs and repository records. Use when splitting substantial work, starting or resuming a task, reporting results, or refreshing a long conversation, in any research repo.
---

# Research task coordination

## 0. Project hookup

Read the repo's `AGENTS.md`, `CLAUDE.md`, or `SKILL/README.md` for overrides. The defaults below follow the author's research repo layout; when a file is absent, say so instead of inventing it.

| Hook | Default |
| --- | --- |
| Plan and scope | `docs/repo_docs/PLANS.md` |
| Decisions | `docs/repo_docs/decisions.md` |
| Measurements | `docs/repo_docs/evidence/numbers.md` |
| Methods | `docs/repo_docs/experiments/` |
| Manuscript directory | `paper/` (older repos: `latex/`) |
| Harness after doc changes | the repo's check script, if one exists |

## 1. Peer roles and authority

Treat conversations as peers, not a master/worker hierarchy. A coordination task synthesizes evidence and brings decisions to the researcher. Experiment, literature and writing tasks own bounded deliverables. Any task can report to another. Role names do not authorize changes to the research question, baseline, learning semantics, success criterion or proposal scope.

The researcher permits proactive creation of useful bounded tasks, within authorized work and the available tools' creation rules. Do not create tasks for trivial actions or recursively multiply tasks. Check the inventory and reuse a relevant existing task before creating a duplicate. User-facing tasks are persistent peers; temporary internal subagents are a separate mechanism for independently executable subtasks, not a replacement for the researcher's writing task.

## 2. Repository first

Follow the project instructions file and the plan (§0). Canonical documents, not a master conversation, carry durable context. Decisions, measurements, methods and execution status each go to their file in §0. Writing consumes evidence and cannot be its only record.

Resolve the project and follow the app tools' checkout rules. Check whether essential context is uncommitted or untracked: fresh worktrees may lack it. Provide the actual source directory and reconcile necessary files deliberately. Never assume default-branch state contains current evidence or commit unrelated changes just to transport context.

## 3. Handoff contract

Include objective, expected output, authorized scope, exclusions, canonical document paths, current status, immediate next action and stopping condition. Identify files the task owns, files another task is editing, relevant remote resources, and permission limits. Specify where to record results and where to send the completion message. Avoid copying the whole conversation.

Do not simultaneously edit the same files or use the same GPUs without coordination. A writing task normally owns the manuscript directory and reads the evidence; it does not launch experiments. Follow the author's writing skills (`academic-writing`, `writing-personal`): scaffold or review by default, draft manuscript prose only when requested.

## 4. Completion and continuity

Return what finished, result paths, limitations, cleanup/live-job status and the next researcher decision. The receiver reads canonical results before summarizing. Use compact status checks or bounded waits, not frequent polling. Do not promise ongoing monitoring without an authorized monitoring mechanism.

Reconcile file changes carefully across worktrees; chat histories do not need merging. Preserve negative results and failed runs. Run the repository harness after document changes.

Refresh an overlong coordination conversation with a concise handoff. The old conversation is historical context, not a mandatory parent. Keep the researcher free to interact directly with any peer task.

Provenance: moved from `xyz-paper/.agents/skills/` into the shared dotfiles skills (2026-09-25); project paths lifted into §0.
