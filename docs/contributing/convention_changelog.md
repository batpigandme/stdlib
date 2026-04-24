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

# Convention Changelog

> A record of convention changes in stdlib, with before/after examples.

<!-- lint disable no-duplicate-headings-in-section -->

## Introduction

stdlib conventions evolve over time. When contributing, **do not assume an existing package follows the latest conventions**. Older packages may use patterns that have since been superseded.

Convention changes tend to be **step-function shifts** rather than gradual drift — one day a pattern is current, and then something changes and it is not. This is why the log is in reverse-chronological order and why later entries may explicitly supersede earlier ones. If two entries appear to conflict, the newer entry wins.

This document tracks convention changes so that contributors (and their tools) can identify current best practices. Each entry includes:

-   A terse **rule** stating what to do.
-   **Before/after** code examples.
-   The **rationale** for the change.
-   The **scope** of affected files.
-   A **reference** commit or tracking issue.

For the full style guides, see the [JavaScript style guide][stdlib-js-style], [C style guide][stdlib-c-style], and other guides in `docs/style-guides/`.

## Active Conventions

Active conventions are migrations that are in progress. Packages are being updated incrementally. When contributing to a package, apply the current convention even if the surrounding code has not yet been updated.

### Use string interpolation in JavaScript benchmark names

**Rule:** Use `format()` from `@stdlib/string/format` for benchmark names. Do not use string concatenation.

**Status:** Active.

**Tracking issue:** [stdlib-js/stdlib#8647][gh-8647].

**Scope:** JavaScript benchmark files (`benchmark/benchmark*.js`), specifically the first argument to `bench()`.

**Do not apply to:** General string construction elsewhere in the package. This convention is about benchmark names only. Other uses of string concatenation in `lib/`, `test/`, or `examples/` are out of scope and should not be changed as part of this migration.

#### Before

```javascript
bench( pkg+':ndims='+ndims, function benchmark( b ) {
    // ...
});
```

#### After

```javascript
var format = require( '@stdlib/string/format' );

// ...

bench( format( '%s:ndims=%d', pkg, ndims ), function benchmark( b ) {
    // ...
});
```

**Rationale:** String interpolation via `format()` improves readability, enables future benchmark name linting, and provides fine-tuned number formatting. See the [benchmark names guide][stdlib-benchmark-names] for the full naming specification.

**Reference commit:** [`086231d`][gh-commit-086231d].

### Use ndarray instance notation in doctests

**Rule:** Use `// returns [ value ]` notation for ndarray return values. Do not manually call `.get()` or `ndarray2array()` solely to display expected values.

**Status:** Active.

**Tracking issue:** [stdlib-js/stdlib#9329][gh-9329].

**Scope:** Documentation examples in `README.md`, `docs/repl.txt`, `docs/index.d.ts`, `examples/index.js`, and `lib/*.js` JSDoc examples.

**Do not apply to:** Runtime code in `lib/` that legitimately uses `.get()` or `ndarray2array()` for non-display purposes. This is a documentation-only convention. If an example genuinely needs to demonstrate element access or array conversion as the subject of the example, keep the decomposition.

#### Before

```javascript
var out = countFalsy( x );
// returns <ndarray>

var v = out.get();
// returns 1
```

#### After

```javascript
var out = countFalsy( x );
// returns [ 1 ]
```

**Rationale:** The [doctest framework][stdlib-doctest] now supports nested ndarray instance notation. The compact form conveys expected behavior more clearly and eliminates unnecessary decomposition logic from examples.

**Reference commit:** [`46d9a44`][gh-commit-46d9a44].

### Use complex number instance notation in doctests

**Rule:** Use `// returns [ re, im ]` notation for complex number return values. Do not decompose into real and imaginary parts using `realf()`/`imagf()` or `real()`/`imag()` solely to display expected values.

**Status:** Active.

**Tracking issue:** [stdlib-js/stdlib#8641][gh-8641].

**Scope:** Documentation examples in `README.md`, `docs/repl.txt`, `docs/index.d.ts`, `examples/index.js`, and `lib/*.js` JSDoc examples.

**Do not apply to:** Runtime code in `lib/` or examples where the subject of the example is specifically demonstrating how to extract real and imaginary components. This is a documentation-only convention intended to remove decomposition logic added purely for display purposes.

#### Before

```javascript
var realf = require( '@stdlib/complex/float32/real' );
var imagf = require( '@stdlib/complex/float32/imag' );

// ...

var y = x.get( 0 );
// returns <Complex64>

var re = realf( y );
// returns 10.0

var im = imagf( y );
// returns 10.0
```

#### After

```javascript
var y = x.get( 0 );
// returns [ 10.0, 10.0 ]
```

**Rationale:** The [doctest framework][stdlib-doctest] now supports complex number instance notation. Removing the decomposition logic reduces verbosity and more clearly conveys expected behavior. When the imports `realf`/`imagf` (or `real`/`imag`) are only used for displaying expected values, remove them as well.

**Reference commit:** [`e8c8651`][gh-commit-e8c8651].

### Use typed array instance notation for complex typed arrays in doctests

**Rule:** Use `// y => [ re1, im1, re2, im2, ... ]` notation for complex typed array expected values. Do not extract and decompose individual elements solely to display expected values.

**Status:** Active.

**Tracking issue:** [stdlib-js/stdlib#4833][gh-4833].

**Scope:** Documentation examples in `README.md`, `docs/repl.txt`, `docs/index.d.ts`, `examples/index.js`, and `lib/*.js` JSDoc examples.

**Do not apply to:** Runtime code in `lib/` that legitimately iterates over typed array elements for non-display purposes. This is a documentation-only convention.

#### Before

```javascript
var realf = require( '@stdlib/complex/float32/real' );
var imagf = require( '@stdlib/complex/float32/imag' );

// ...

ccopy( x.length, x, 1, y, 1 );

var z = y.get( 0 );
// returns <Complex64>

var re = realf( z );
// returns 1.0

var im = imagf( z );
// returns 2.0
```

#### After

```javascript
ccopy( x.length, x, 1, y, 1 );
// y => [ 1.0, 2.0, 3.0, 4.0, 5.0, 6.0 ]
```

**Rationale:** The [doctest framework][stdlib-doctest] now supports typed array instance notation for complex number typed arrays. This mirrors the annotation style already used for real-valued typed arrays (e.g., `Float64Array`).

### Use dynamic memory allocation for large arrays in C benchmarks

**Rule:** Use `malloc()`/`free()` for large array allocations in C benchmarks. Do not use stack-allocated variable-length arrays (e.g., `double x[ len ];`).

**Status:** Active.

**Tracking issue:** [stdlib-js/stdlib#8643][gh-8643].

**Scope:** C benchmark files (`benchmark/c/benchmark.c`) where array size depends on a runtime parameter such as `len`.

**Do not apply to:** Small fixed-size stack allocations such as `int64_t shape[ 3 ];` or `double coords[ 4 ];`. These do not risk stack overflow and should remain stack-allocated. Runtime code in `src/` is also out of scope — this convention targets benchmarks specifically.

#### Before

```c
static double benchmark( int iterations, int len ) {
    double x[ len ];
    // ...
}
```

#### After

```c
static double benchmark( int iterations, int len ) {
    double *x;
    // ...
    x = (double *)malloc( len * sizeof( double ) );
    // ...
    free( x );
    // ...
}
```

**Rationale:** Static allocation of large variable-length arrays can cause segmentation faults on systems with limited stack memory. See [stdlib-js/stdlib#369][gh-369] for context.

**Reference commit:** [`f0f8a70`][gh-commit-f0f8a70].

### Use kebab-case for all directory names

**Rule:** Name all directories using kebab-case. Do not use camelCase, PascalCase, or snake_case for directory names anywhere in the repo.

**Status:** Active.

**Scope:** All directories — including but not limited to test fixture directories (`test/fixtures/`), package subdirectories, and any other directories introduced in a PR.

**Do not apply to:** File names — those follow the conventions of their own type (e.g., JavaScript files use camelCase or dot-separated names; JSON fixture files use snake_case). This rule is specifically about directory names, not file names.

#### Before

```text
test/fixtures/largeDynamic/
test/fixtures/small_static/
```

#### After

```text
test/fixtures/large-dynamic/
test/fixtures/small-static/
```

**Rationale:** Kebab-case is the project-wide convention for directory naming. Active migrations have focused on test fixture directories where inconsistency was most common, but the rule itself applies to all directories.

**Reference commits:** [`6c4e286`][gh-commit-6c4e286], [`62019bc`][gh-commit-62019bc].

<!-- Keep entries in reverse chronological order. When a convention is fully adopted, move it to the "Completed Conventions" section below. -->

## Completed Conventions

_No conventions have been fully adopted yet. When a migration is complete, entries will be moved here from "Active Conventions."_

<section class="links">

[stdlib-js-style]: https://github.com/stdlib-js/stdlib/blob/develop/docs/style-guides/javascript/README.md

[stdlib-c-style]: https://github.com/stdlib-js/stdlib/blob/develop/docs/style-guides/c/README.md

[stdlib-benchmark-names]: https://github.com/stdlib-js/stdlib/blob/develop/docs/contributing/benchmark_names.md

[stdlib-doctest]: https://github.com/stdlib-js/stdlib/blob/develop/docs/contributing/doctest.md

[gh-8647]: https://github.com/stdlib-js/stdlib/issues/8647

[gh-9329]: https://github.com/stdlib-js/stdlib/issues/9329

[gh-8643]: https://github.com/stdlib-js/stdlib/issues/8643

[gh-8641]: https://github.com/stdlib-js/stdlib/issues/8641

[gh-4833]: https://github.com/stdlib-js/stdlib/issues/4833

[gh-369]: https://github.com/stdlib-js/stdlib/issues/369

[gh-commit-086231d]: https://github.com/stdlib-js/stdlib/commit/086231d0bcfe2d4a9c4c932fc9333f8ac63c4087

[gh-commit-46d9a44]: https://github.com/stdlib-js/stdlib/commit/46d9a441ddf70ca13ac2a8d61cf54c628876e537

[gh-commit-e8c8651]: https://github.com/stdlib-js/stdlib/commit/e8c8651693bc38d999b5f46cf31ccd370ad6cb8c

[gh-commit-f0f8a70]: https://github.com/stdlib-js/stdlib/commit/f0f8a70989b6cfdabf6b928650c50b28aab5e224

[gh-commit-6c4e286]: https://github.com/stdlib-js/stdlib/commit/6c4e28697eb

[gh-commit-62019bc]: https://github.com/stdlib-js/stdlib/commit/62019bc2c7d

</section>

<!-- /.links -->
