<!--

@license Apache-2.0

Copyright (c) 2026 The Stdlib Authors.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

-->

<!-- lint disable expected-html-sections -->

# Whitespace Aesthetic Philosophy

> On the intentional use of negative space in stdlib code.

## Introduction

stdlib has no lint rule enforcing whitespace inside parentheses or array index brackets. This is not a gap — linters like ESLint can enforce such rules. The absence of such a rule is deliberate.

The [JavaScript Style Guide][stdlib-js-style] covers the more general whitespace cases — spaces around operators, spaces inside array indices, spaces before leading braces, and so on. Several of those rules are tagged **"Enforcement: Code review"** rather than as linter rules, and several carry **"Use discretion"** notes for complex cases (e.g., `bar[0]` with no spaces inside a ternary; compacted arithmetic inside `((x+y+z)*(t-w-v)) + 5`). That placement is deliberate, not a backlog item. Those rules are reviewer-enforced because they are themselves aesthetic; a deterministic linter applying them would get wrong the very cases the "Use discretion" notes call out. This document picks up where the style guide leaves off — it elaborates what that discretion looks like in finer-grained, more context-dependent situations. The [C Style Guide][stdlib-c-style] takes the same posture for C code, and the reasoning below applies cross-language.

The reason whitespace at this level is **aesthetic and contextual**, not mechanical, is that the goal is for contributors to develop taste: an intuition for when spacing clarifies and when it obscures. This document captures the underlying philosophy so that taste can be cultivated, explained, and — where appropriate — applied by automated tools.

This document is intended for two audiences:

-   **Contributors** learning when and why whitespace choices matter
-   **AI tools and reviewers** applying this thinking during PR review

## The Core Principle

**Negative space draws visual attention to salient parts of an expression, and visually groups related symbols.**

Kgryte has stated the philosophy explicitly in review: _"My preference is to use negative space to visually group related symbols and to draw the eye to the most salient information. This is \[the] philosophy underlying our use of negative space throughout the project."_ ([stdlib-js/stdlib#4768][gh-4768]) A more compact phrasing in a different review: _"Use whitespace to highlight salient operations."_ ([stdlib-js/stdlib#10485][gh-10485])

Negative space has two jobs, then. **Highlighting:** when you add spaces around a sub-expression, you signal "this is what you need to read." When everything is spaced equally, nothing stands out; when nothing is spaced, the reader must tokenize the expression mentally. **Grouping:** a blank line between two clusters of related statements, or a compacted sub-expression inside a larger one, tells the reader "these belong together; those belong together" without a comment. Both are forms of the same underlying choice — using the absence of ink to communicate structure.

The art is choosing _what is salient_ in a given context.

This principle has a long lineage. Old Fortran code consistently uses spaces inside parentheses to make the logical structure of expressions legible. stdlib adopts the same approach across its languages — most commonly JavaScript, where the bulk of review feedback has anchored the convention, but also C, where the same rationale has been invoked verbatim.

## Array Indexing

Array indexing is the canonical application of this principle.

Spaces inside index brackets make the indexing logic visually distinct from the variable being indexed. The reader can immediately identify where the array access begins and end, and parse the index expression without effort.

### When the index expression is non-trivial, use spaces

```javascript
// Before — no visual separation; requires mental tokenization
x[iMinusJ+1]

// After — the index expression stands out
x[ iMinusJ + 1 ]
```

#### When the index arithmetic is complex, compact it

A common mistake is to apply spaces uniformly across all sub-expressions within an index, treating every operator as equally salient. This produces the opposite of the intended effect — the reader now has to parse a cloud of whitespace to find the structure.

```javascript
// Anti-pattern — exploded index arithmetic; harder to parse than no spaces
strides[ d + S2 - 1 ] = st[ d ];

// Better — compact the arithmetic so the index reads as a unit; keep outer bracket spacing
strides[ d+S2-1 ] = st[ d ];
```

Athan's review comment on the above: _"Learn to use whitespace more effectively to help direct the eyes to salient info. Here, with all the terms, you are making it harder for readers to read."_ ([stdlib-js/stdlib#10706][gh-10706])

The same PR contains a second suggestion that shows the principle applied selectively within a single `for` statement:

```javascript
// Before — arithmetic in loop initializer has spaces applied uniformly
for ( i = S2 - 2; i >= 0; i-- ) {

// After — arithmetic compacted; comparison operator retains spaces
for ( i = S2-2; i >= 0; i-- ) {
```

`S2-2` is compacted; `>= 0` is not. This is not a mechanical rule about operator types — it is a judgment about what is salient in this particular expression. The arithmetic in the initializer reads as a single logical unit (the starting index). The comparison boundary `>= 0` is what the reader needs to parse explicitly. In a different context, `S2 - 2` with spaces might be perfectly readable.

Elsewhere in the same PR, `d + 1` is also suggested for compaction in a loop initializer. The point is not that `d + 1` is _always_ wrong with spaces — there are places in the codebase where it is left alone. The point is that in that specific expression, in that specific context, compacting it was the right call.

This is what makes whitespace a matter of aesthetics rather than rules. A lint rule would enforce one form globally, context-blind. The guidance here allows a reviewer to say: "in _this_ expression, the spacing is working against readability" — and to explain why — without claiming it applies everywhere.

The general orientation: **compact arithmetic that reads as a unit; keep spaces where the reader needs to parse a condition or boundary**. Apply judgment to the specific expression at hand.

A subtler case: when both index arithmetic and outer arithmetic appear on the same line, the two conventions coexist.

```javascript
ima = sign * viewA[ ia+1 ];
rex = viewX[ ix ];
imx = viewX[ ix+1 ];
```

Inside the brackets, the offset arithmetic is compact (`ia+1`, `ix+1`). Outside, the multiplication `sign * viewA[ ... ]` retains spaces around `*` because that operation is itself part of what the reader needs to see. Same line, opposite spacing choices — both correct, because the salience differs. ([stdlib-js/stdlib#10485][gh-10485])

_TODO(kgryte): Add an example involving nested or multi-dimensional indexing, to illustrate how the principle extends._

### Preserve visual units when multiple accesses appear in the same expression

When a single statement contains more than one array access, each access should read as its own compact visual unit. Whitespace-exploded arithmetic inside any one of them forces the reader to parse across the gaps, reassemble the full index, and then repeat the exercise for the next access — losing the outer structure of the statement in the process.

The example below is drawn from the C implementation of `dmediansorted`. Kgryte explicitly noted in the same review thread that the rationale matches the JavaScript source implementation, so while the syntax is C, the whitespace principle is the same one applied in JS.

```c
// Before — each index is spread across multiple whitespace boundaries; the outer pattern of "two accesses added and divided" is obscured
return ( X[ offsetX + ( n * strideX ) ] + X[ offsetX+( ( n - 1 ) * strideX ) ] ) / 2.0;

// After — each access reads as a single unit; the outer structure `( X[...] + X[...] ) / 2.0` is immediately visible
return ( X[ offsetX+(n*strideX) ] + X[ offsetX+((n-1)*strideX) ] ) / 2.0;
```

Kgryte's rationale: _"Visually group related operations in order to make obvious what is being computed. Meaning, use whitespace to highlight salient parts of the code. Here, IMO, it is best to highlight that the array `X` is being accessed by two indexing operations, which should form two distinct visual units, rather than be spread out across various whitespace."_ ([stdlib-js/stdlib#4466][gh-4466])

Note the stronger stance in this example: **every** whitespace gap inside each set of brackets collapses. When two or more accesses share a line, the argument for compacting each one intensifies — the reader's eye needs unambiguous boundaries between units, not just compactness within a single unit.

### Avoid superfluous parenthesization in index expressions

Parentheses are a grouping signal, much like whitespace. Applying them to a sub-expression that already reads as a single unit — a bare identifier, a property access, a literal — is the same kind of noise as exploding arithmetic across unnecessary whitespace. The reader sees grouping marks and looks for grouping; finding none, they have done work for no payoff.

```javascript
// Before — the parens around `z.length` add a grouping signal with nothing to group
if ( isnanf( z[ i%(z.length) ] ) ) {

// After — `z.length` is already a single unit; the surrounding brackets are the only grouping needed
if ( isnanf( z[ i%z.length ] ) ) {
```

Kgryte's review comment: _"Not clear why you are wrapping `z.length` in parentheses."_ The same suggestion recurs across benchmark, ndarray benchmark, and example files in [stdlib-js/stdlib#10485][gh-10485] — when the pattern appears PR-wide, that is a signal to strip it PR-wide.

The principle generalizes: **structural markers — whether parentheses or whitespace — should always have something to disambiguate**. If they do not, they are visual clutter competing with the markers that do.

## Fixture File Formatting

The same principle — negative space communicates structure — applies to JSON fixture files that represent matrices or multi-dimensional arrays.

When a fixture stores data that is semantically a matrix, the formatting should communicate that structure visually. A reader who must mentally segment a long flat list to find row boundaries, or count through stride-spaced elements to understand padding, is doing work the formatting should do for them.

Kgryte's review comment from [stdlib-js/stdlib#10262][gh-10262]: _"Prefer formatting this and the other matrices as matrices in order to aid readability when examining fixture files. Applies here and throughout the fixture files in this PR."_ And on the follow-up: _"Otherwise, how is a reader supposed to know when a row begins and ends? You are making the reader do a lot of work here."_

This is one of the hardened cases in this document. **Apply the appropriate sub-pattern for the storage layout** — the right choice differs depending on whether the array is dense, strided, or a compact band format.

**Applies PR-wide.** When one fixture in a LAPACK or ndarray package uses matrix-formatted layout, every fixture in that PR representing matrix data should match.

### Dense / unit-stride matrices

For dense matrices stored with unit strides, the established stdlib convention is a two-key structure: the raw storage array `A` stays flat on one line (preserving its identity as a storage buffer), while a companion `A_mat` key renders the logical matrix with one row per line. Columns within rows are space-aligned where widths differ.

```json
{
  "strideA1": 2,
  "strideA2": 1,
  "offsetA": 0,
  "A": [ 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0, 11.0, 12.0 ],

  "A_mat": [
    [ 1.0, 2.0,  3.0, 4.0  ],
    [ 5.0, 6.0,  7.0, 8.0  ],
    [ 9.0, 10.0, 11.0, 12.0 ]
  ]
}
```

The flat `A` is not reformatted into rows — it is left as-is to reflect actual storage. `A_mat` is where the matrix structure lives. Output arrays follow the same split: `A_out` flat, `A_out_mat` row-grouped. ([stdlib-js/stdlib — `claswp` fixtures][gh-claswp])

### Non-unit stride / strided matrices with padding

When strides are non-unit, the raw array contains padding values (sentinel `9999.0` marks out-of-stride slots). Row-grouping `A` directly would be misleading — the row boundaries in the logical matrix do not correspond to evenly spaced intervals in storage. Instead, `A` is formatted as a **vertical list** (one element per line) so the padding is explicitly visible. The companion `A_mat` key still provides the clean logical view.

```json
{
  "strideA1": 6,
  "strideA2": 2,
  "offsetA": 0,
  "A": [
    1.0,
    2.0,
    9999.0,
    9999.0,
    3.0,
    4.0,
    9999.0,
    9999.0,
    9999.0,
    9999.0,
    9999.0,
    9999.0,
    5.0,
    6.0,
    9999.0,
    9999.0,
    7.0,
    8.0,
    9999.0,
    9999.0,
    9999.0,
    9999.0,
    9999.0,
    9999.0
  ],

  "A_mat": [
    [ 1.0, 2.0, 3.0, 4.0 ],
    [ 5.0, 6.0, 7.0, 8.0 ]
  ]
}
```

The vertical layout of `A` is intentional, not a default. It forces the reader to see that the logical elements are sparse within the buffer. Grouping `A` into rows here would actively obscure that. ([stdlib-js/stdlib — `claswp` fixtures][gh-claswp])

### Compact / banded storage

Some LAPACK routines use compact band storage, where each row of the storage array directly corresponds to a logical entity (a diagonal band, a set of superdiagonals, etc.). In this case there is no mismatch between storage rows and logical rows — the array itself can be formatted directly as nested rows without a companion key.

```json
{
  "AB": [
    [ 0, 2, 5, 8 ],
    [ 1, 4, 7, 10 ],
    [ 3, 6, 9, 0 ]
  ]
}
```

The judgment call here is determining the row width, which requires knowing the leading dimension or shape from the package's `README.md` or companion test. Don't guess — look it up. ([stdlib-js/stdlib#10262][gh-10262])

## Blank Lines as Grouping

Horizontal whitespace is one axis of the principle; vertical whitespace is the other. A blank line between two groups of related statements is itself a communicative choice — it tells the reader "these belong together; those belong together" without a comment.

Fixture imports in test files are a canonical case. Related fixtures often cluster by storage layout, scenario, or shape, and a blank line between clusters makes the grouping visible at a glance.

```javascript
var COL_MAJOR = require( './fixtures/column_major_no_offsets.json' );
var COL_MAJOR_IPIV_STRIDE_POS = require( './fixtures/column_major_ipiv_stride_positive.json' );
// ... other COL_MAJOR fixtures ...
var COL_MAJOR_K1 = require( './fixtures/column_major_k1.json' );

var ROW_MAJOR = require( './fixtures/row_major_no_offsets.json' );
var ROW_MAJOR_IPIV_STRIDE_POS = require( './fixtures/row_major_ipiv_stride_positive.json' );
// ... other ROW_MAJOR fixtures ...
var ROW_MAJOR_K1 = require( './fixtures/row_major_k1.json' );
```

The blank line carries the group boundary. Without it, the eye reads one long homogeneous list and has to pattern-match on the variable-name prefixes to recover structure.

Benchmark files apply the same principle to a different job: separating **phases** in a sequence rather than grouping related items. The stdlib benchmark style convention is that data-generation code is visually separated from the timing block by a blank line.

```javascript
// Before — data generation runs directly into the timing block
x = uniform( 100, EPS, 100.0, opts );
b.tic();

// After — the blank line marks the transition from setup to the timed section
x = uniform( 100, EPS, 100.0, opts );

b.tic();
```

Planeshifter's review on this pattern: _"Let's add an empty line before `b.tic()` to match our benchmark style convention (data generation should be visually separated from the timing block)."_ ([stdlib-js/stdlib#10330][gh-10330])

Blank lines, then, can mark either **cohesion within a group** (the fixture case above) or **separation between phases** (the benchmark case here). Both use absence to carry meaning.

**A lint error is not always right.** When a mechanical rule strips — or flags for stripping — a blank line that was carrying meaning, **the correct response is to disable the rule at that site, not to comply**. Kgryte's review comment on exactly this scenario: _"Here we actually want the empty line in order to visually group related fixtures. The lint rule should have been disabled here."_ ([stdlib-js/stdlib#9690][gh-9690])

This is one of the sharpest illustrations of why these concerns live in prose and not in CI. A linter cannot see the intent of a blank line. A human reviewer — or an AI reviewer operating this document — can.

## Vertical Alignment of Parallel Data

The principle extends beyond production code to **documentation examples**. In a README, a contributor is teaching a reader how to read the output; the example's visual layout is itself part of the pedagogy.

When a function operates over parallel arrays — a mask and the values it filters, paired inputs and expected outputs, index-aligned elements across multiple arrays — declaring them on adjacent lines lets the reader drop their eye vertically and see the correspondence without scanning.

```javascript
// Before — the mask is inline; the correspondence between `x` elements and mask bits is buried inside the function call
var x = [ 1, 2, 3, 4 ];

var y = mskfilterMap( x, [ 0, 1, 0, 1 ], clbk );

// After — the mask is extracted to a named variable directly below `x`; each column lines up with its counterpart
var x = [ 1, 2, 3, 4 ];
var m = [ 0, 1, 0, 1 ];

var y = mskfilterMap( x, m, clbk );
```

Kgryte's rationale: _"The idea behind these changes is to make it visually more obvious what values are masked and to minimize eye movement when interpreting output results."_ ([stdlib-js/stdlib#1705][gh-1705])

Two moves are at work:

1.  **Extract inline data to a named variable** when the data has a name worth giving. A mask is not `[ 0, 1, 0, 1 ]` — it is `m`. Pulling it out of the function call creates a line on which the reader can register the mask as a thing, separate from its use.
2.  **Stack parallel arrays** on adjacent lines so corresponding positions align vertically. Once `x` and `m` are both on their own lines, the reader can trace `1→0`, `2→1`, `3→0`, `4→1` at a glance — the relationship is _visible_ rather than inferred.

The blank line between the setup (`x`, `m`) and the use (`var y = ...`) is the same grouping-blank-line pattern discussed in [Blank Lines as Grouping](#blank-lines-as-grouping), applied here to separate "data" from "call."

## Function Call Arguments

_TODO(kgryte): Explain when spaces inside function call parens are beneficial vs. detrimental. Include concrete before/after examples._

## Operators and Grouping

The principle from Array Indexing generalizes beyond brackets: **compact arithmetic that reads as a sub-unit; keep spaces around the operators that separate sub-units**.

A ternary expression illustrates both moves in a single line. The `?` and `:` separate three parts — condition, then-branch, else-branch — and should retain their surrounding spaces; those are the structural seams the reader is parsing. The arithmetic _inside_ each branch can compact, because each branch reads as a single signed quantity.

```javascript
// Before — each branch's subtraction has equal spacing to the `?` and `:`; all four operators compete for the reader's eye
return ( isNegative ) ? x - rTail : rTail - x;

// After — the arithmetic in each branch collapses to a sub-unit; `?` and `:` retain their role as branch separators
return ( isNegative ) ? x-rTail : rTail-x;
```

Kgryte's commit message for this change: _"Remove spaces in order to visually group related expressions."_ ([stdlib-js/stdlib@7966a41][gh-7966a41])

Two operators at two precedence levels are in play: `-` (arithmetic, binds tight) and `? :` (ternary, binds loose). When the looser operator is where the reader needs to see structure, the tighter one underneath should compact. Spacing follows _semantic salience_, not operator precedence — but precedence is a reasonable first guess when no stronger signal is available.

_TODO(kgryte): Add further examples covering logical operators, comparison chains, and mixed arithmetic/assignment cases._

## When Negative Space Is Not Beneficial

Negative space becomes a detriment when:

-   It is applied uniformly, making all sub-expressions look equally important
-   The expression is simple enough that tokenization is trivial (spaces add noise, not signal)
-   It explodes an otherwise compact expression across visual space, requiring the reader to scan rather than perceive

_TODO(kgryte): Add concrete examples of over-spaced code with annotations explaining why the spacing works against readability._

## There Are No Absolute Rules

This style is **not dogmatic**. There are many exceptions, and the right choice depends on what is salient in the specific expression at hand. The discretion is intentional.

Contributors are expected to develop this judgment over time — by reading existing stdlib code, by observing review comments, and by cultivating an eye for what negative space is actually drawing attention to in a given context.

A corollary of the non-dogmatic stance: **don't go out of your way to enforce whitespace on existing code**. Sweeping PRs that flip `x[i]` to `x[ i ]` across a file — or across a package — tend to create more work than they resolve. Kgryte's framing on one such PR: _"For the most part, we are not militant about this. By default, yes, we use spaces. But we also allow some flexibility depending on what aspects of the code should be visually emphasized ... I wouldn't go overboard with going out of your way to enforce spacing, so long as a file is consistent. Otherwise, you're likely to just create more work for yourself."_ ([stdlib-js/stdlib#2189][gh-2189])

The bar that _does_ matter for pre-existing code is **consistency within a file**. If a file already uses `x[i]` throughout, don't flip one expression to `x[ i ]` in isolation; either leave it or change the whole file with a rationale. The one mechanical rule the project is strict about is **symmetry** — `[i ]` and `[ i]` are always wrong regardless of context, because they read as typos rather than as deliberate choices.

## Guidance for Reviewers and AI Tools

When reviewing code for whitespace aesthetics, the question to ask is:

> Does the spacing in this expression draw attention to what is actually salient? Or does it apply whitespace uniformly, obscure the structure, or explode an otherwise readable expression?

Concrete heuristics:

-   **Index expressions:** is the arithmetic inside the brackets compact or exploded? Prefer compact.
-   **Superfluous parens in index expressions:** is a bare identifier, property access, or literal wrapped in parentheses? If the brackets are the only grouping the reader needs, strip the inner parens.
-   **Simple expressions:** do the spaces add anything, or is the expression short enough to read without them? Prefer fewer spaces for trivial expressions.
-   **Complex expressions:** do the spaces help the reader identify sub-structure? If so, they are probably justified.
-   **Consistency with context:** does this expression follow the same spacing pattern as similar expressions in the same file or namespace? If not, is there a reason?
-   **JSON fixture arrays that represent matrices:** is the array formatted flat, or does it visually mirror the row structure? If the data is a matrix, prefer row-grouped formatting. Apply this to all fixture files in the PR, not just the one under review.
-   **Blank lines between related statements:** is a group boundary being communicated visually? If a lint rule has stripped or complained about a blank line that was doing real grouping work, the fix is a localized lint-disable comment, not removing the line.
-   **Asymmetric bracket spacing:** `[ i]` or `[i ]` is always wrong regardless of context — brackets either both have interior space or neither does. This is one of the few places where the project is strict.
-   **Proportionality:** is this change worth the review cost? Sweeping whitespace-only PRs across unrelated expressions rarely pay for themselves. Flag an individual expression where spacing is actively hurting readability; don't run a file- or package-wide whitespace refactor.
-   **Parallel data in examples:** are mask/value/index arrays declared on adjacent lines so corresponding positions align vertically? If parallel data is inline in a function call — especially in README examples — consider extracting it to a named variable above the call so the reader can trace the correspondence with a single eye-drop.
-   **Benchmark setup vs. timing block:** in `benchmark/benchmark.js`-style files, is there a blank line between the data-generation code and the `b.tic()` call? The setup/measurement boundary is one of the few places in stdlib where a blank line is treated as near-mandatory rather than judgment-laden.
-   **Operators at multiple precedence levels on one line:** when a line mixes tight operators (arithmetic) with looser ones (ternary, comparison, assignment), is the looser operator kept spaced as a structural separator while the tighter arithmetic beneath it compacts? Spacing should reflect the structural level the reader needs to see, not operator precedence per se.

When making a suggestion, always explain _why_ — "the index arithmetic here reads more clearly when compacted" is more useful than "remove the spaces."

## Relationship to the Linter

The linter does not catch whitespace aesthetic issues by design. A clean linter pass does not mean whitespace is correct — it means the formatter's mechanical rules are satisfied. These are different things.

The linter enforces the rules it can verify deterministically. Whitespace aesthetics require judgment. Do not interpret linter silence as confirmation that spacing is idiomatic.

The converse also holds: **a lint error is not always right**. When a mechanical rule would strip whitespace that is carrying meaning — a blank line grouping related declarations, for example — the correct response is to disable the rule at that site with a localized `eslint-disable-line` (or equivalent) comment, not to comply blindly. See [Blank Lines as Grouping](#blank-lines-as-grouping) for a concrete case.

## See Also

-   [JavaScript Style Guide][stdlib-js-style] — the full style guide for JavaScript in stdlib
-   [C Style Guide][stdlib-c-style] — the full style guide for C in stdlib
-   [Convention Changelog][stdlib-convention-changelog] — record of convention changes; check before using an older package as a template

<section class="links">

[stdlib-js-style]: https://github.com/stdlib-js/stdlib/blob/develop/docs/style-guides/javascript/README.md

[stdlib-c-style]: https://github.com/stdlib-js/stdlib/blob/develop/docs/style-guides/c/README.md

[stdlib-convention-changelog]: https://github.com/stdlib-js/stdlib/blob/develop/docs/contributing/convention_changelog.md

[gh-10706]: https://github.com/stdlib-js/stdlib/pull/10706

[gh-10485]: https://github.com/stdlib-js/stdlib/pull/10485

[gh-10262]: https://github.com/stdlib-js/stdlib/pull/10262

[gh-4466]: https://github.com/stdlib-js/stdlib/pull/4466

[gh-4768]: https://github.com/stdlib-js/stdlib/pull/4768

[gh-9690]: https://github.com/stdlib-js/stdlib/pull/9690

[gh-2189]: https://github.com/stdlib-js/stdlib/pull/2189

[gh-1705]: https://github.com/stdlib-js/stdlib/pull/1705

[gh-10330]: https://github.com/stdlib-js/stdlib/pull/10330

[gh-7966a41]: https://github.com/stdlib-js/stdlib/commit/7966a41c5b52a87385b701319645696ba0a459a5

[gh-claswp]: https://github.com/stdlib-js/stdlib/tree/develop/lib/node_modules/%40stdlib/lapack/base/claswp/test/fixtures

</section>

<!-- /.links -->
