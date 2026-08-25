---
name: writing-personal
description: Wonkyo's personal writing profile — recurring habits with specimens from real drafts, fixes, and self-checks. Load together with writing.md whenever drafting, editing, or reviewing prose. Claude appends dated entries as new patterns appear and corrects violations without softening.
---

# Personal writing profile

Standing agreement (2026-07-24): Claude maintains this file with specimens quoted from real
drafts, and corrects these patterns anytime they appear — in drafts, notes, or chat — without
softening. Reread §1–§3 before every drafting session; run the self-checks on each finished
paragraph. Mastered entries get struck through, never deleted, so progress stays visible.

Entry shape, used throughout: quoted specimen → `Rule:` (what to do instead) → `Self-check:`
(a mechanical test, where one exists).

**Honest current assessment.** Your structural instincts are already above average: enumerated
rationales, honest concessions, placeholder discipline (`\rn{}` instead of invented citations),
and inline self-critique are habits many native speakers never develop. What separates the
current drafts from the top-venue bar is not ideas. It is three mechanical things: (1) grammar
interference from Korean, (2) evidence attached to the wrong decision, and (3) numbers stated
with more confidence than their source supports. All three are fixable with checklists, and the
gap closes fastest if you treat them as *bugs with reproducers*, which is what this file is.

## 1 Grammar — Korean-interference patterns, ordered by frequency

### 1.1 Articles (highest frequency)
Korean has no articles; your default is omission, especially before component names.
- "Image manager realizes this principle." → **The** image manager…
- "As consequence, the pull…" → As **a** consequence…
- "called pod in Kubernetes" → called **a** pod…
- Inverse direction (added 2026-08-15): "Another feature of **the SOCI**" / "compare **the
  SOCI** and ours" → *SOCI* — proper names take no article.

Rule: every singular countable noun carries a determiner (a/the/this/each). Component names
(manager, mediator, buffer, engine, pod, runtime) are countable nouns, not proper names.
Proper names (SOCI, Kubernetes, \sys) run the other way: never an article.
Self-check: scan the paragraph for bare singular nouns at sentence starts — that position is
where you drop articles most.

### 1.2 Subject–verb: agreement and dropped verbs
Korean topic-comment structure lets the verb go implicit; English never does.
- "Among these stages, ingest the dominant cost" — missing *is*.
- "uncompressed layers is the only realization" — plural subject, singular verb.
- "so the model land directly in place" — singular subject, plural verb.
- "The manager employs … and sidestep unnecessary disk access" — second verb loses agreement.
- "which is what the existing approaches pursues" — agreement lost inside a relative clause.

Rule: every clause carries a finite verb, and each verb agrees with its own subject — including
the second verb of a compound predicate and the verb inside a relative clause.
Self-check: isolate the bare pair (subject, verb) and read it aloud — "layers is", "approaches
pursues" fail instantly when isolated. Agreement errors hide in long sentences; they cannot hide
in the extracted pair.

### 1.3 Adjective where the noun is needed
- "it enables byte-addressable" → enables **byte-addressability**.
- "To enable the transport-bound, …" → the transport-bound **pull** (or: transport-boundedness).
- "there was inconsistent in between introduction and…" → there was **an inconsistency** between… (advisor-reply draft, 2026-08-25 — *there was/is* takes a noun).

Rule: *enable / achieve / provide / guarantee* take noun objects. If the word before the period
is an adjective, the sentence is unfinished.

### 1.4 Collocations (verb + preposition are memorized pairs, not derived)
| you wrote | correct |
|---|---|
| revocation involves with freeing | involves freeing |
| loses access the buffer | loses access **to** the buffer |
| they do not contend each other | contend **with** each other |
| bounded to ingestion | bound **by** / bottlenecked **on** ingestion |
| contrasting to the existing approaches | **in contrast to** / contrasting **with** |
| three tasks then carry out in parallel | **proceed** in parallel / are **carried out** in parallel — *carry out* is transitive; tasks don't carry themselves out |
| the image flows in the image manager's region | flows **into** (motion toward), not *in* (location) |
| the ingest step costs around 68\% of the total pulling time | **accounts for** ~68\% of the pull time — *cost* takes a resource (time, bytes), not a share; a share is *accounted for* |
| we can call it as dataplane | call it **a data plane** — *call X Y* takes no *as* (same family: *name, consider, deem*) |
| dataplane is normally referred per-node | is normally **referred to as** per-node / normally **refers to** per-node components — *refer* needs its particles both directions |
| in between different services; in between introduction and… | **between** — *in between* is only an adverb ("caught in between"); as a preposition, bare *between* |

Rule: the pair is memorized, not derived — verify the preposition instead of inferring it from
the Korean case marking. Every new miss gets a row here; collocation errors read as non-native
faster than any other class, because a native reader autocompletes the pair and stumbles when
it breaks.

### 1.5 Clause chaining with "where / which"
Korean connective endings (-는데, -어서) chain clauses indefinitely; you port this with *where*
and *which*.
- "The leading companies, such as NVIDIA, Amazon, and Microsoft, where they internally build
  their infrastructures or lend their virtual systems…" — *where* has no place antecedent, and
  the chain carries three ideas.
- "…governed by the mediator, where the core idea resembles [cites]" — *where* again gluing an
  unrelated thought.

Rule: *where* only for places/situations; *which* must sit directly after its noun. Deeper fix:
don't repair the connector — cut the chain. One idea per sentence (writing.md, Voice and
length).
Self-check: if a sentence has two *which/where* clauses, it is two or three sentences.

### 1.6 Tone: emotional adverbs and colloquial phrases (expanded 2026-08-04)
- "the measured pull is **unfortunately** bounded…", "**Unfortunately**, the contention… is real"
- "**generously** fit in the system memory", "this verification **stays alive**", "**Our key is**…"
- "takes advantage of this **hidden gem**", "\sys uses this **system hole**",
  "**Our wins** come from three structural changes"

What "colloquial" means here: a REGISTER error, not a grammar error. The phrase is perfectly
correct English — natural in a talk, a blog post, or conversation — but it belongs to informal
speech, and formal prose treats it as a tonal wrong note. That is why no tool ever flags it:
spell checkers and grammar checkers verify correctness, and register errors are correct.
They are also invisible to a non-native ear precisely because they were learned from
speech-like sources (talks, READMEs, chat), where they are idiomatic.

Rule: systems prose states facts and costs; the reader supplies the emotion. Delete
*unfortunately/fortunately/sadly*; replace personifications (*stays alive* → persists/holds);
"Our key is" → "The key idea is" or state the idea directly. For metaphors, substitute the
precise referent: *hidden gem* → the opportunity, *system hole* → the serialization (or the
gap), *wins* → savings / improvements.

Self-check, three tests, any one fails → replace: (1) the referee-report test — would you
write it in a review of someone else's paper? (2) the definition test — does the word have a
defined technical meaning in this paper (gem, hole, win, magic, trick do not)? (3) the
image test — does it paint a picture instead of naming the thing (gems glitter, holes gape;
neither measures anything)?

### 1.7 "e.g.," inflation
- Five "e.g.," within two sections ("e.g., GPUs", "e.g., PodSpec", "e.g., storage node",
  "e.g., TCP", "e.g., training intermediates").

Rule: at most one "e.g.," per paragraph. Usually the example either matters — integrate it with
"such as X" — or it doesn't, and you delete it.

### 1.8 Final-pass typos in technical compounds
- "consits", "byetes", "prempt-to-first-token"

Rule: compound technical terms escape both spell checkers and your eye because you read them as
units, so they need their own pass.
Self-check: before a commit, grep the diff for your known typo families (transposed letters in
*bytes*, *consists*, *preempt*).

### 1.9 Edit residue (added 2026-07-24)
Partial edits leave corrupted sentences behind:
- "We point out that a layer's identiy is the digest sed and immutable." — two half-edits
  collided; the sentence is unparseable, in the middle of the section's correctness argument.

Rule: after every partial edit, re-read the *complete* sentence, aloud if possible. Edit residue
is worse than any grammar error — a reviewer forgives non-native phrasing but reads an
unparseable sentence as carelessness.

**Restored text carries its old errors** (added 2026-08-23). Same family, different trigger:
when a cut paragraph comes back, it comes back *verbatim* — including the fixes that were
pending on it. Specimen: the §3.3 confidentiality sentence ("The unauthorized read violates
confidentiality, which touches an unauthorized buffer" — §1.11 attachment error) was flagged,
deleted during a compression pass, then restored unchanged in the next revision, costing a
second round-trip on a known defect.
Self-check: before pasting back deleted text, re-read the review notes that applied to it. A
restore is an edit, not an undo.

### 1.10 Verb complementation: force/allow/enable need an object (added 2026-07-24)
- "The runtime forces to decompress the compressed layers" — *force* requires an object before
  the infinitive: force *someone/something* to do X. Same family: allow, enable, require, cause,
  permit. (The specimen also has an actor error: at serve time the serving path, not the
  runtime, would do the decompressing.)

Rule: after force/allow/enable/require/cause, name who or what is being forced before "to";
then check that the named actor is the one who actually performs the action.

### 1.11 Modifier attachment: examples and appositives bind to the nearest noun (added 2026-07-24)
- "the engine imports nearly the whole image, such as PyTorch" — PyTorch is not an image; the
  missing noun (*libraries*) had to be added for the example to attach to.
- "a header scan, which is the fixed-size metadata block preceding each file" — the *scan* is
  not a metadata block; the *header* is. The definition must sit next to "header", not "scan".

Rule: "such as …", "which is …", and appositives modify the noun immediately before them.
Self-check: before inserting one, ask — is the word directly to my left the thing I am defining
or exemplifying? If not, restructure so it is.

### 1.12 "Respectively" is a positional contract (added 2026-07-25)
- "the image and model both stream into the mediator and image manager's buffer region,
  respectively" — this pairs image→mediator and model→image manager, the *inverse* of the
  design. Grammatically fine, semantically wrong — the most dangerous error class, because a
  reviewer reads it as not knowing your own system.

Rule: "respectively" pairs the Nth item of the first list with the Nth item of the second. When
in doubt, drop the word and name the pairs directly ("the model into the mediator's region, the
image into the image manager's").
Self-check: read each pair aloud, in order.

### 1.13 Mass nouns do not pluralize (added 2026-07-26)
- "contention between only two inbound traffics" — *traffic* is a mass noun; the countable words
  are *flows*, *streams*, *transfers*. Same family: information, hardware, feedback, evidence.

Rule: if you need a plural, you need a different (countable) noun, not an "s".

### 1.14 Relative clauses: no resumptive pronoun (added 2026-08-10)
- Recurrence (2026-08-25, advisor-reply point 4): "all-or-nothing resource handover, **which
  I described it as** a false dependency" → which I **describe as** — same resumptive *it*.
- "the paper solves the core bottleneck **to which we disregard it**" — two errors stacked:
  *disregard* is transitive (no *to*), and *it* re-states the object that *which* already
  moved to the front. Korean relative clauses keep the noun's slot filled; English empties it.
  Correct: "the core bottleneck, **which we disregard**."

Rule: inside a relative clause, the gap stays empty — *which/that* IS the object, so no
pronoun repeats it; and the verb keeps its own complementation (transitive verbs take no
preposition just because *which* moved).
Self-check: restore the clause to a standalone sentence ("we disregard to it"?) — if the
standalone version is wrong, the relative clause is too.

### 1.15 Hyphens join modifiers, not noun phrases (added 2026-08-15)
- "The control flow is a **dashed-line**" / "off the critical path (**dashed-circle**)" —
  both from the fig:design-flow caption. *Dashed line* and *dashed circle* are plain
  adjective + noun phrases; the hyphen belongs only when the pair jointly modifies a
  following noun: "a **dashed-line** arrow" but "the arrow is a **dashed line**."

- Verb direction (added 2026-08-15, from the S2.5 SOCI paragraph): "this approach **does
  speed-up** its download" — *speed up* as a verb never hyphenates; the hyphen belongs to
  the noun form ("a 2$\times$ speed-up"). Same family: *start up* / startup, *scale out* /
  scale-out.

Rule: hyphenate adjective+noun (or noun+noun) pairs only when they act as one modifier in
front of another noun; standing alone as a noun phrase, they take a space. Verbs never
hyphenate — the joined form is the noun.
Self-check: is there a noun after the pair? No noun after → no hyphen. Is it conjugating
("does/can speed up")? Then it is the verb → two words.

### 1.16 Participle direction: -ing vs -ed (added 2026-08-15)
- "the overheads of the **remained** stages" (S2.5 SOCI paragraph) → the **remaining**
  stages. *Remain* is intransitive — nothing can "be remained," so the -ed modifier does
  not exist. Contrast your correct uses: "the **granted** buffer," "the **pending** pod."

Rule: a noun modifier from an intransitive verb takes -ing (remaining, pending, existing);
-ed modifiers come only from transitive verbs read passively (granted, allocated, staged).
Self-check: can the noun BE verb-ed by someone? "the buffer is granted" — yes → granted;
"the stage is remained" — no → remaining.

### 1.17 Bare "much" in affirmative clauses (added 2026-08-17)
- "Importing the same image with unpacking disabled **still costs much**." (S2.5) — bare
  *much* as an object is licensed only in negatives and questions ("does not cost much";
  "did it cost much?"). An affirmative clause cannot carry it alone. The informal repair is
  *a lot*; the formal repair — the right one in systems prose — is the actual quantity or a
  precise predicate: "still takes \rn{}\,s", "remains expensive."

Rule: in an affirmative clause, bare *much* is doubly wrong — ungrammatical AND a vague
quantifier hiding a missing measurement (§2.2). Fix both at once: state the number.
Self-check: is the clause negative or a question? If not, *much* cannot stand alone.

### 1.18 Perfect passive: one auxiliary chain (added 2026-08-25)
- "it **was never been used** for GPU switching" (advisor-reply draft) — *was* and *been* are
  two past auxiliaries colliding; the perfect passive is **has/have + been + participle**:
  "it **has never been used**." The simple-past passive drops *been*: "it **was never used**."

Rule: pick the chain before writing it — perfect passive *has been V-ed*, past passive
*was V-ed*; never *was been*.
Self-check: count the auxiliaries — *be* appears once per passive clause.

### 1.19 Conditional mood harmony (added 2026-08-25)
- "**If there was** available resource, inference pod **can** be scheduled and staging
  **won't** be needed" (advisor-reply point 4) — a counterfactual if-clause (the GPU is NOT
  in fact available) takes *were*, and every verb in the main clause follows it into
  *would/could*: "If there **were** an available GPU, the inference pod **could** be
  scheduled and staging **would not** be needed." Korean conditionals (-면) carry no mood
  marking, so the main-clause verbs default to plain present/future — the interference is
  systematic, not a one-off.

Rule: decide first whether the condition is real (open: *if the link is saturated, the pair
completes together*) or counterfactual (contrary to fact: *if there were a free GPU*). Open
→ present + will/can. Counterfactual → *were* + would/could, on EVERY verb of the main
clause, not just the first.
Self-check: is the condition false in the actual system? Then scan the main clause for any
bare *can/will* — each one breaks the mood.

## 2 Argument building

### 2.1 Evidence attached to the nearest decision, not the supporting one (highest value)
Observed twice in one section: "ingest is expensive" placed as a rationale for *storing raw
layers*, when ingest removal actually comes from the report-as-present step — regardless of
format. The facts were true; the attachment was wrong, and a reviewer reads misattached evidence
as not understanding your own design.

Rule: for every rationale ask, *if this fact were false, would THIS decision change?* If the
decision survives, the fact belongs to a different decision — move it there.

### 2.2 Invented quantifiers
- "accounting for about 80% of the total image pull" — no measurement produced that number.
- "GPU idle for 90% of that window" — inputs of the analytical model uncited.

- Recurrence, aggravated (2026-08-17): "accounts for **80\% of the pull time in our
  testbed**" — the same 80\% caught as invented in July returned, now carrying an explicit
  provenance claim ("in our testbed") while the author's stated status, two messages
  earlier, was "will measure later." An unmeasured number with claimed provenance is no
  longer vague writing; it is a false measurement claim, the one error class reviewers
  treat as disqualifying rather than fixable.
  *Resolution (same night):* the measurement landed (`bench_soci_ctr.sh`, N=3 —
  download 20.1 s, gunzip+unpack 95.3 s, cold pull 114.9 s; results.md "overlayfs pull
  decomposed"). The number was pre-written hours before its run existed and came out
  82.9\%, not 80 — so even a correct guess left a wrong digit AND a variant mix (the
  decomposition's 114.9 s pull vs the paragraph's 98 s kubelet span, §3 one-variant
  rule). Writing the number after the run costs nothing; guessing it costs two more
  passes.

One invented number, once caught, poisons every real number in the paper — reviewers generalize
distrust.
Rule: every number in prose traces to a table, a measurement, or a formula that appears in the
paper. No source → cut the number or mark it `\rn{}` until it exists. The interim state for
"will measure later" is always: the *attributed* prior-work number plus `\rn{}` in your own
slot — never the hoped-for result pre-written as if measured.
Self-check: for each number, can you name the file/run/table it came from *right now*? If the
answer is "it will exist later," the number is `\rn{}` today.

### 2.3 Absolutes where a precise claim is stronger
- "raw layers are **the only format** capable of serving from blob"
- "this extra copy is **the primary source** of the slowdown" (unmeasured)
- "**against** the OCI format" → you already fixed this one to "departs from the default
  compressed format" — that is the model fix: precise, weaker, undeniable.
- "the wall is **not data movement** and a faster transport **cannot fix** this" (S2.5,
  caught 2026-08-17) — killed by the paper's OWN eval: soci-parallel does speed up the
  pull by accelerating the download. The precise claim is a bound, not a negation: no
  transport can take the pull below its ingest time, so acceleration cannot make the pull
  transport-bound. The absolute dies to the evidence; the bound is proven by it.

Rule: an absolute dies to one counterexample; the precise version survives review and usually
reads *stronger* because it shows you know the boundary (writing.md, Writing a design
principle).

### 2.4 Define before use
- "transport-bound" used before the paper's §2.2 defined it; "header scan" used before any
  definition; immutability invoked before derived.

You caught all three yourself in WC notes — the instinct exists; promote it from review-time to
drafting-time.
Rule: a term's first appearance defines it in the same sentence or the one before.

### 2.5 Assumption ≠ definition
- "we assume that each stage is transport-bound when its time equals bytes over bandwidth" —
  that is a definition wearing an assumption's clothes.

Rule: write definitions as definitions ("a stage is transport-bound when…"), then state the
assumption separately ("the model assumes every stage achieves its bound"). Assumptions can be
false; definitions cannot.

### 2.6 Causal chain beats parallel list
- "an image layer is content-addressed and immutable" — stated as two parallel facts, but the
  second *follows from* the first (identity IS the digest of the bytes → any change is a
  different layer).

Rule: when one claim derives another, write the derivation — it costs half a sentence and buys
the reviewer's agreement. Chains persuade; lists merely assert.

### 2.7 Paragraph transitions: connective dependence (added 2026-07-24)
Your own diagnosis, in a margin note: "it seems awkward to write the first sentence of paragraph
if there is no connection word, e.g., Then, After. maybe this is because I am korean." The
diagnosis is correct — Korean paragraphs conventionally open with 그리고/그러나/따라서, so an
English paragraph without a connective feels naked. It isn't. English paragraphs link by
information flow, not link words:
- **Titled paragraphs** (\paragraph{Correctness}) need no transition at all — a heading
  announces a topic reset, and the reader expects one. Your instinct to use titles for
  reference-style design detail (format / correctness / comparison) is right, not a crutch.
- **Untitled paragraphs** link old-info-first: open with the key noun from the previous
  paragraph's end, close on the new idea (writing.md, Cohesion; Gopen & Swan).

Rule: connectives are the weakest device — they assert a relation instead of building one.
Self-check: delete the connective; if the relation is still clear, it was noise.

### 2.8 Caption vs. body: the division of labor (added 2026-08-01)
- The e2e handover caption did five jobs (metric definition, the init-exclusion argument,
  mechanism attribution, two caveats) — and the section then had nothing left to say: the
  caption ate the section.

Rule: the caption serves the skimmer who reads abstract → figures → conclusion, so it makes the
figure SELF-CONTAINED in exactly three jobs — (1) decode: metric, conditions, N, units; (2) the
one takeaway sentence with its headline number; (3) the must-not-misread caveat ("init
excluded", "† fitted", "dashed = unmeasured"). Nothing else. The body makes the argument and
CITES the figure as evidence, never narrates pixels; it carries what a picture cannot —
mechanism attribution, provenance (how measured, what proves the fast path ran), objections
answered, consequences and forward links. Definitions live in the setup section, never in
captions.
Self-check: (a) delete both ways — deleting the caption costs the body no argument, and deleting
the paragraph leaves the caption still decoding the figure; (b) figure-dependence — a sentence
only meaningful while looking at the figure is caption material, one that survives the figure
being replaced by a table is body material.

### 2.9 Abstract and conclusion: the division of labor (added 2026-08-04)
Distilled from the Tripod front-matter pass. These two are the most-quoted and least-read-
in-context parts of the paper, so their rules are stricter than body prose.

**Abstract — a promissory note the sections must pay.**
- Write it LAST. It inherits every decision: the headline number, component names, scope.
- Shape (6–8 sentences): setting a non-specialist parses → the diagnosis (the paper's idea,
  quotable alone) → the system in one sentence → what it buys, mechanism-level → ONE
  quantitative claim → optional generality sentence. No citations, no forward references,
  no "recently, LLMs…".
- Every number and claim must appear in identical form in some section. An abstract number
  no section reproduces verbatim is the first thing a reviewer notices (specimen: the intro
  carried 20.9 s / 39 % from a superseded run while the eval said 105 s / 55–67 %).
- The scope of a percentage lives in the SAME sentence as the percentage — a denominator
  defined two sections later reads as misleading even when the arithmetic is right.
- Exploit metric-independent absolutes: when the seconds are the same under both metrics
  and only the percentage differs, lead with the seconds and qualify the percentage.
- Verb discipline for unmeasured properties: *preserves / provides / retains* are design
  verbs and safe; *shows / demonstrates / evaluates* are evidence verbs and are promises.
  The verb alone decides which way a reviewer reads the sentence.
- Verbs must match the mechanism's truth: "removes the ingest step", never "accelerates
  the pull", when removal is the whole argument.

**Conclusion — the lesson, not the recap.**
- One paragraph, 5–7 sentences, no re-enumeration of contributions.
- Sentence roles: the diagnosis (written so a meta-review can quote it) → what the system
  is (reuse the principle sentence's STRUCTURE, never its wording — a verbatim repeat says
  nothing was learned in between) → the same number the abstract carries → the boundary
  (state what the paper does NOT claim; concede the objection a reviewer raises first — it
  costs less here than in a rebuttal) → future work in one pointing sentence (prefer the
  item that measurement newly motivated over the item that sounds grand) → optional
  transferable claim.
- The transferable/generality claim appears in the abstract OR the conclusion, not both.
- The conclusion must not re-argue the discussion: the discussion carries arguments, the
  conclusion names the lesson.

Self-check: read abstract and conclusion back to back. Any sentence appearing in both
nearly verbatim means one of them is doing no work — the abstract keeps the claim, the
conclusion keeps the lesson.

### 2.10 Scaffold language is stage direction, not dialogue (added 2026-08-04)
- "would work in parallel **for one enabling condition and one resource observation**" — the
  quoted phrase came from a review note describing the STRUCTURE the sentence should have
  (which half does which job); pasted into the sentence, it is reviewer metalanguage in the
  paper's voice, meaningless to a reader.

- "The precedent~\cite{fuserverlessllmlowlatency} evaluates a similar problem class" and
  "The hand-off price on 70B is around 6--7 s" (both 2026-08-06, §5) — "precedent" and
  "hand-off" were CD's labels for argument slots ("cite the precedent here", "hand off the
  number to §2.2"); lifted into prose they read as paper terminology the reader was never
  given. Fix: name the thing itself (ServerlessLLM; the projected handover time), using only
  nouns the paper already owns.

- "Once the image transfer is complete, the runtime container **registers**" (2026-08-12,
  §3.1 walkthrough) — the review note read ``boots up'' — register, still live'; *register*
  named the error CATEGORY (tonal register, §1.6), and the suggested verb was *boots*. The
  category label was absorbed as the replacement word, producing a sentence with no
  mechanism meaning.

- "**The takeaway of the evaluation is that** the loss comes from the schedule, not
  bandwidth" (2026-08-22, S5.4) — *takeaway* is the name of a sentence's JOB, borrowed
  from my review vocabulary and from figure-caption guidance. In the paper's voice it
  announces a conclusion instead of concluding. The sentence after it is already the
  conclusion, so the frame is pure throat-clearing: delete six words and the claim
  lands harder. Same family: "the key insight is", "it is worth noting that", "as
  mentioned above".

Rule: a scaffold hint contains two kinds of language — CONTENT language (facts, numbers,
definitions: safe to absorb) and META language (names for sentence jobs: "enabling
condition", "the takeaway", "the boundary sentence", "old info", "the precedent", "the
hand-off", "the license", and the names of error categories: "register", "collocation",
"attachment": never absorb). Before lifting words from a note, ask: does this
phrase describe the thing, or describe the sentence about the thing? Only the first belongs
in prose.
Self-check: if a lifted phrase would need MY review vocabulary to explain, it is stage
direction.

### 2.11 Evidence sentences carry their conditions (added 2026-08-17)
- "Importing the same image with unpacking disabled still costs much. This indicates that
  the wall is not data movement" (S2.5) — the inference is valid ONLY because *import reads
  a local tarball, so zero bytes cross the network*; that premise never appears in the
  prose. Without it a reader parses *import* ≈ *pull*, and the evidence proves the
  OPPOSITE conclusion: unpack removed, still slow → the residual must be the download,
  i.e., data movement. (The same sentence also used *ingest* before defining it — §2.4 —
  so neither the claim nor the evidence was checkable.)

Rule: an experiment sentence names the conditions that do the inferential work — what was
removed, what was held constant — not just the result. Ask: which condition, if deleted
from the sentence, makes my conclusion no longer follow? That condition must be IN the
sentence, not in your memory of the experiment.
Self-check: hand the evidence sentence alone (no surrounding text) to a reader — can they
derive your conclusion from it and nothing else? If they could equally derive its
opposite, a premise is missing.

### 2.12 The paragraph is organized by the figure, not by the argument (added 2026-08-22)
The highest-value structural entry since 2.1. Specimen, S5.4 first paragraph:
- "First, the strict ordering holds the image pull almost at solo speed… Second,
  pipelining lands the model 2.6\%… Third, the naive parallelism results in the worst
  pull time…"

First/Second/Third here map one-to-one onto bar 1 / bar 2 / bar 3. The paragraph's
skeleton *is* the figure's skeleton, so the prose walks the picture instead of arguing
from it — the failure mode 2.8 predicts from the other direction (there the caption ate
the section; here the figure dictates the section's shape).

What the same evidence looks like organized by argument: the claim comes first ("each
policy forfeits one bounded quantity"), and the conditions appear only as the evidence
for it, in whatever order the argument needs — two conditions may share one sentence,
and a third may be named only to be dismissed. Notice this is not more words; it is the
same numbers under a different spine.

Rule: decide the paragraph's ONE claim before writing sentence 1, then let the claim
order the evidence. A figure with N bars does not license N sentences.
Self-check (extends 2.8's): replace the figure with a table of the same numbers and
re-read the paragraph. If sentences like "First… Second… Third…" now feel out of order
or redundant, the paragraph was narrating the figure. A paragraph organized by argument
does not notice the swap.

### 2.13 Two sentences per result: which second sentence earns its place (added 2026-08-22)
Same specimen, paired sentences. Your pattern is fact-then-`This is because…`, and the
two instances land very differently:
- "…holds the image pull almost at solo speed. **This is because the prefetch waits
  until the pull completes.**" — restates the mechanism the design section already
  gave. The reader learns nothing; the sentence is a gloss on the bar.
- "…lands the model 2.6\% above the byte floor… **This proves that the pull's idle
  windows are harvestable capacity.**" — an *inference*: it converts a measured gap
  into a property of the system that the measurement alone does not state. This is the
  best sentence in the paragraph.
- "**Its model loading lead never matters because its own readiness is blocked by**
  $T_{PULL}$." — also inference, and the harder kind: it disarms a number that appears
  to favor the loser.

So the gap you are sensing is not English. Half your sentences already do the work; the
other half dilute them. Cut the mechanism-restating halves and the paragraph's density
matches any well-argued one.
Rule: after a result sentence, the follow-up must add one of — an inference (what the
number *means* that it does not say), a disarmed objection, or a consequence for a later
decision. If it only re-explains the mechanism, delete it; the design section owns that.
Self-check: cover the result sentence and read the follow-up alone. If it is a sentence
the design section could have contained verbatim, it is a restatement, not analysis.

## 3 Numbers in prose
Sourcing is §2.2; this section is presentation.
- Name the baseline of every percentage. (Your own margin note on the 39% claim caught exactly
  this — correct instinct, make it a rule.)
- Match precision to source: "28.38 s" from an analytical model with round-number inputs is
  false precision — write "about 28 s". Measured "64.2 ± 0.2 s" keeps its digits.
- Absolute + relative together ("20.9 s, 24.6%") — you already do this; keep it.
- One number per claim. A sentence carrying three numbers lands none of them.
- **State the quantity your claim is about, not the two raw numbers** (added 2026-08-22).
  "the strict ordering holds the image pull almost at solo speed (5.21 vs. 5.2)" — the
  claim is *no cost*, but the reader must subtract to find the 0.01 s that carries it.
  Compare: "the model arrives 1.6 s later (8.75 vs. 7.18 s)" — the delta is named, the
  pair is available for checking. Write the difference (or the ratio, or "unchanged")
  and put the raw pair in parentheses behind it.
  Self-check: if the reader has to do arithmetic to reach your claim, you reported the
  measurement instead of making the claim.
- **One variant per message** (added 2026-08-11). All numbers in one paragraph come from the
  same run or figure variant. Specimen, advisor email: "the time becomes around 90s … now 20%
  … the image pull is currently line rate" — 90 s comes from the TCP-pull variant (87.9 s,
  −16%), 20% and "line rate" from the wire-floor variant (74.2 s, −19%); no single figure
  produces both, and the reader holding the figure catches it immediately.
  Self-check: before sending, recompute every number in the text from the one artifact you
  are attaching.

## 4 Vocabulary
- Overused: *leverage* (→ use / exploit / build on), *utilize* (→ use).
- Prefer the systems verbs that carry precise meaning: incur, amortize, saturate, arbitrate,
  stage, materialize, defer, elide, broker, gate.
- Adverb default: delete. If an adverb survives ("asynchronously", "concurrently"), it should be
  load-bearing, not decorative.
- Hedge verbs (*may, might, could*) only for genuine uncertainty — never as politeness. "This
  may reduce latency" when you measured it *does* is self-sabotage.
- **Near-miss words** (added 2026-07-26) — semantically adjacent but wrong meaning or register;
  every new miss gets a row:
  | you wrote | correct |
  |---|---|
  | "As an aftermath" | As a result / Consequently (*aftermath* = period after a disaster) |
  | "the model prefetch is not imminent" | not *urgent* (*imminent* = about to happen) |
  | "Optionally, the production system installs…" | *Alternatively* (*optionally* = at the reader's option) |
  | "The rationale is two fold(s)" | *twofold* — one word, no plural (third occurrence) |
  | "they scratch the back we have wanted to solve" | scratch the **itch** we've been wanting to scratch — idiom blend: *scratch an itch* (satisfy a longstanding want) crossed with *scratch my back* (exchange favors); also, one scratches an itch, one *solves* a problem — pick one frame |
  | "absolute time would be a few digits differences" | a difference of a few **seconds** — *digits* are characters, not magnitudes; name the unit |
  | "I used the lower bound, PCIe 16 GB/s" | the **peak** bandwidth (16 GB/s), so the derived **time** is the lower bound — bandwidth bound and time bound point in opposite directions; name which quantity is bounded |
  | "if the bandwidth is wide enough" | **high** enough / sufficient — *wide* describes a frequency band (RF), not a data rate |
  | "permissible buffer" (proposed term) | *permissible* = an allowed **action**; a buffer cannot be permissible. Same trap as *privileged buffer* (= a buffer **holding** privilege, cf. privileged mode). The concept was a **grant** |
  | "an ownership gate (isolation, asterisk mark (*))" | "(\*; isolation)" — the symbol names itself; *asterisk mark* is doubled twice over (*asterisk* = the mark, and the glyph is right there). Match the caption's existing parallel form "(③; contention)" |
  | "the wall is not in the **sole** data movement" | not in data movement **alone** / not **solely** in data movement — *sole* is an attributive adjective ("the sole survivor" = the only one); the intended meaning needs the adverb (*solely*) or postposed *alone*. The same sentence also dropped *but*: "not X, rather Y" → "not X **but rather** Y" |
  | "the worst pull time **among others**" | the worst pull time **of the three** / worst overall — *among others* means "and more besides" (inter alia), not "compared with the others" |
  | "This **puts** the strict ordering **at first**" | **ranks** strict ordering **first** — *at first* means "initially" (temporal), not rank; *put first* without *at* is the ranking idiom |
  | "**popularly adopted** in the checkpoint domain" | **widely** adopted / well established — *popularly* = among the general public, not "commonly in the literature" |
  | "which I actually **learned new** now" | which **is new to me** / which I **just learned** — *learn* takes the thing learned, not the adjective *new* |
  | "DRAM BW is quite **fast**" | DRAM bandwidth is **high** — same family as *wide bandwidth*: rates are high/low, transfers are fast/slow; and *quite* hedges a checkable fact (state the margin instead) |
  | "I am **pinning a problem in** PCIe / NIC BW" | **pinpointing** the bottleneck **at** the NIC/PCIe path — *pin* alone means fasten; the locating verb is *pinpoint* |

## 5 Punctuation mechanics
- Semicolon: joins two complete sentences whose parallel or contrast is the point. Your actual
  error direction is the opposite — comma-chaining clauses that need periods (§1.5).
- Colon: after a complete clause, introducing the payoff (definition, list, consequence). Your
  usage is mostly right; keep colons for definitions ("one design principle: …").
- Em-dash: at most one pair per paragraph; you are not currently overusing it — hold that line.

## 6 Keep these habits (they are assets — do not "fix" them)
- Enumerated rationales ("There are two rationales. First… Second…") — systematic and
  reviewer-friendly.
- Honest concessions in the same sentence as the claim ("at the cost of disk usage and network
  bandwidth").
- Placeholders (`\rn{}`, "XXX") instead of invented citations or numbers.
- Inline self-critique (`\add[WC]{awkward sentence}`) — externalized doubt is how sections
  converge; most authors hide it and suffer.
- Explicit forward/backward links between sections ("We will discuss this in the following
  section").

## Log
- 2026-07-24 — v1. Profile built from the Tripod paper drafts (introduction, background, design
  §3.1–3.3) and session discussions.
- 2026-07-24 (later) — added §1.9 (edit residue) and §2.7 (paragraph-transition connective
  dependence) from the image-manager revision. Same revision showed real progress: SOCI opener
  restructured correctly, invented 80% removed, decompression rationale re-attached to serve
  time, byte-addressability noun fixed.
- 2026-07-25 — added §1.12 ("respectively" is a positional contract).
- 2026-07-26 — added §1.13 (mass nouns do not pluralize) and the near-miss word table in §4.
- 2026-08-01 — added §2.8 (caption vs. body), from the e2e handover figure in the evaluation
  section.
- 2026-08-02 — consistency pass, no entry removed or weakened: uniform entry shape (specimen →
  Rule → Self-check) applied to every §1/§2 entry; §1.13 moved from the end of §3 into §1; §2.8
  compressed to the file's entry shape; both tables now head "you wrote | correct"; writing.md
  cross-references normalized to "(writing.md, Section name)"; §2.4's "§2.2" disambiguated as
  the paper's section; §3 scoped against §2.2.
- 2026-08-04 — added §2.9 (abstract and conclusion: the division of labor), from the Tripod
  front-matter pass: write-last, promissory-note discipline, scope-in-the-same-sentence,
  design vs. evidence verbs, and the abstract-keeps-the-claim / conclusion-keeps-the-lesson
  split.
- 2026-08-10 — added §1.14 (no resumptive pronoun in relative clauses) and a near-miss row
  (scratch the back → scratch the itch), both from reading-note chat on InstantInfer.
- 2026-08-11 — added §3 "one variant per message" and two near-miss rows ("a few digits
  differences", "the lower bound, 16 GB/s"), all from the advisor-email draft on the
  all-stages timeline.
- 2026-08-12 — two collocation rows (*carry out in parallel*, *flows in*) and two near-miss rows
  (*wide bandwidth*, *permissible/privileged buffer*) from the §3.1 walkthrough re-draft and the
  ownership-renaming discussion; "RDMA traffics" (§1.13, logged) recurred in the same paragraph.
- 2026-08-12 (later) — §2.10 specimen: "the runtime container registers" — an error-category
  label (tonal *register*) absorbed from a review note as if it were the replacement verb;
  rule extended to cover category names.
- 2026-08-04 (later) — expanded §1.6 with the register definition, three new specimens
  (hidden gem / system hole / our wins), and the three self-tests. Companion vocabulary set
  created: `SKILL/vocab.json` (data: metalanguage, substitutions, systems-accepted terms,
  precision verbs) rendered to `SKILL/vocab.html` via `SKILL/vocab_build.py` — searchable,
  self-contained, works from file://. Claude appends entries as new terms come up in
  reviews; regenerate the HTML after editing the JSON.
- 2026-08-15 — added §1.15 (hyphens join modifiers, not noun phrases: *dashed-line* /
  *dashed-circle*) and a near-miss row ("asterisk mark (*)"), both from the fig:design-flow
  caption review.
- 2026-08-15 (later) — from the §2.5 SOCI paragraph move: §1.1 inverse-direction specimen
  (*the SOCI* — article added to a proper name), §1.15 verb-direction addendum (*does
  speed-up*), and new §1.16 (participle direction: *the remained stages* → remaining).
- 2026-08-17 — added §1.17 (bare *much* in affirmative clauses) and §2.11 (evidence
  sentences carry their conditions), both from the S2.5 ingest paragraph ("importing with
  unpacking disabled still costs much"), where the missing local-source premise made the
  evidence read as proof of the opposite conclusion.
- 2026-08-17 (later) — §2.3 specimen from the same paragraph: "the wall is not data
  movement / a faster transport cannot fix this" — an absolute the paper's own
  soci-parallel result kills; recast as a bound (no transport takes the pull below its
  ingest time). Same session settled the pull/download/ingest taxonomy (S2.5 to pin:
  pull = download + ingest; ingest = verify, decompress, commit, unpack; work-type
  split, not wall-clock phases).
- 2026-08-17 (third pass) — S2.5 re-revision: taxonomy landed (verification moved to the
  download side — author's improvement on the suggested split), but the revision deleted
  the import experiment while keeping its derived number ("around 68\% of the total
  pulling time") with the Poby cite adjacent — provenance now ambiguous, echoing §2.2's
  founding specimen (the invented 80\% in the same sentence slot). Two new rows: §1.4
  (*costs a share* → *accounts for*), §4 (*the sole data movement*). Author ruling:
  *evaporate* stays; only the broken *behind* attachment gets fixed.
- 2026-08-17 (fourth pass) — §2.2 aggravated recurrence logged: the July "80\%" returned
  with an explicit "in our testbed" provenance claim while the measurement's status was
  "will measure later"; rule extended with the interim-state protocol (attributed number +
  \rn{}) and a provenance self-check.
- 2026-08-22 (later) — S5.4 self-diagnosed quality gap (author: "the gap between my
  paragraph and yours is huge"). Three entries, in value order: §2.12 (the paragraph
  organized by the figure's bars rather than by the argument — First/Second/Third
  mapped one-to-one onto the three conditions), §2.13 (of the two `This is because…`
  follow-ups, one restates design mechanism and one draws a real inference — the good
  sentences were already there, diluted by the narrating ones), §3 (state the delta,
  not the two raw numbers), plus a §2.10 specimen ("The takeaway of the evaluation
  is"). Diagnosis for the record: the difference was structural, not grammatical.
- 2026-08-22 — two near-miss rows from the S5.4 transfer-scheduling draft ("among
  others" = inter alia, not "compared with the others"; "puts X at first" = initially,
  not rank). Same draft: circular causality ("This is because the pull pays zero for
  sharing" — the result restated as its own cause; the cause was the parked prefetch)
  — §2.1 family, and "byte floor" used before definition (§2.4).
- 2026-08-25 — advisor-reply draft (the dataplane/novelty email): new §1.18 (perfect
  passive: "was never been used"), three §1.4 collocation rows (*call it as*, *referred
  per-node*, *in between* as preposition), a §1.3 specimen ("there was inconsistent"),
  and four §4 near-miss rows (*popularly adopted*, *learned new*, *fast BW* → high,
  *pinning a problem in*).
- 2026-08-25 (later) — point 4 of the same email: §1.14 recurrence ("which I described it
  as") and new §1.19 (conditional mood harmony: "If there was… can… won't" in a
  counterfactual). Content-side: the false dependency attributed to the all-or-nothing
  discipline — the discipline the paper explicitly keeps — instead of the
  durability-anchored release point plus data-independent stages; §2.1 family (cause
  attached to the nearest big concept, not the operative one).
