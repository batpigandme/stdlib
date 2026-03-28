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

# C Style Guide

> _An opinionated style guide for writing C._

## Table of Contents

1.  [Introduction](#introduction)
2.  [General Principles](#general-principles)
3.  [Whitespace](#whitespace)
4.  [File Structure](#file-structure)
5.  [Include Guards](#include-guards)
6.  [C++ Compatibility](#c-compatibility)
7.  [Variables and Types](#variables-and-types)
8.  [Naming](#naming)
9.  [Functions](#functions)
10. [Comments](#comments)
11. [Error Handling](#error-handling)
12. [Portability](#portability)
13. [Node-API Addons](#node-api-addons)
14. [Additional Resources](#additional-resources)
15. [License](#license)

## Introduction

Always abide by the **Law of Code Style Consistency**, or, in other words, _when in Rome, do as the Romans do_.

While the code base to which you want to contribute may be a horrific mess in terms of aesthetic appearance and style, style consistency takes precedence over personal preference and canon. The more consistent a code base is in terms of style, the more readers of the code can focus on what the code does rather than deciphering changes in style.

So, even if your peers commit various _faux pas_ outlined below, as long as you are contributing to their code base, abide by their conventions.

A code base--module, repository, application, library, etc--should always appear to have a single author and not be a schizophrenic franken-mess. This stated, for those opportunities where you are the primary author, you should lead by example and write clean, readable, and testable code.

Hopefully, most of the conventions outlined below will help enable you to do so.

<!-- <rule-set> -->

* * *

## General Principles

<!-- <rule> -->

### Rule: Do one thing well

##### Reason

A function or module with a single, clearly defined purpose is easier to
understand, test, and compose. Scope creep leads to functions which are
difficult to reason about and hard to reuse.

##### Bad Example

```c
// Do not...

/**
* Computes the absolute value of x and prints a debug message.
*
* @param x  input value
* @return   absolute value of x
*/
double abs_and_log( const double x ) {
    printf( "abs_and_log called with x = %f\n", x );
    if ( x < 0.0 ) {
        return -x;
    }
    return x;
}
```

##### Good Example

```c
// Do...

/**
* Computes the absolute value of a double-precision floating-point number.
*
* @param x  input value
* @return   absolute value
*/
double stdlib_base_abs( const double x ) {
    if ( x < 0.0 ) {
        return -x;
    }
    return x;
}
```

##### Enforcement

Code review.

<!-- </rule> -->

<!-- <rule> -->

### Rule: Prefer stdlib functions over system equivalents

##### Reason

stdlib provides implementations that are tested, consistent across platforms,
and integrated with the project's dependency tracking and build infrastructure.
Using raw system functions (e.g., `sqrt` from `<math.h>`) bypasses these
guarantees and may produce platform-specific behavior.

##### Bad Example

```c
// Do not...
#include <math.h>

double y = sqrt( x );
```

##### Good Example

```c
// Do...
#include "stdlib/math/base/special/sqrt.h"

double y = stdlib_base_sqrt( x );
```

##### Notes

-   This ensures consistent behavior across platforms and allows stdlib's testing
    infrastructure to validate all dependencies.

##### Enforcement

Code review.

<!-- </rule> -->

<!-- </rule-set> -->

<!-- <rule-set> -->

* * *

## Whitespace

<!-- <rule> -->

### Rule: Use tab indentation

##### Reason

Tabs allow each developer to configure their editor to display indentation at
their preferred visual width without affecting the shared source file. Mixing
tabs and spaces produces inconsistent results across editors and tools.

##### Bad Example

```c
// Do not...
double stdlib_base_abs( const double x ) {
    if ( x < 0.0 ) {
        return -x;
    }
    return x;
}
```

##### Good Example

```c
// Do...
double stdlib_base_abs( const double x ) {
    if ( x < 0.0 ) {
        return -x;
    }
    return x;
}
```

##### Enforcement

`.editorconfig`

<!-- </rule> -->

<!-- <rule> -->

### Rule: Include spaces around binary operators

##### Reason

Spaces around operators improve readability by making it clear that two
operands are being combined rather than running together into a single token.

##### Bad Example

```c
// Do not...
double y = x*s;
double z = a+b*c;
```

##### Good Example

```c
// Do...
double y = x * s;
double z = a + b * c;
```

##### Enforcement

Code review.

<!-- </rule> -->

<!-- <rule> -->

### Rule: Include spaces inside control-flow parentheses

##### Reason

Consistent with the stdlib JavaScript style and improves readability by
visually separating the condition from the parentheses.

##### Bad Example

```c
// Do not...
if(N <= 0) {
    return 0.0;
}
for(i = 0; i < N; i++) {
    // ...
}
```

##### Good Example

```c
// Do...
if ( N <= 0 ) {
    return 0.0;
}
for ( i = 0; i < N; i++ ) {
    // ...
}
```

##### Enforcement

Code review.

<!-- </rule> -->

<!-- <rule> -->

### Rule: Include a space after comment markers

##### Reason

A space between `//` and the comment text is required for readability and is
consistent with the style used throughout the stdlib codebase.

##### Bad Example

```c
// Do not...
//compute the sum
//returns NaN for invalid inputs
```

##### Good Example

```c
// Do...
// Compute the sum.
// Returns NaN for invalid inputs.
```

##### Enforcement

Code review.

<!-- </rule> -->

<!-- <rule> -->

### Rule: Separate variable declarations from the first statement with a blank line

##### Reason

A blank line after the variable declaration block makes it immediately clear
where declarations end and executable code begins, reducing visual noise.

##### Bad Example

```c
// Do not...
double stdlib_base_abs( const double x ) {
    double s;
    double y;
    s = 10.0;
    y = x * s;
    return y;
}
```

##### Good Example

```c
// Do...
double stdlib_base_abs( const double x ) {
    double s;
    double y;

    s = 10.0;
    y = x * s;
    return y;
}
```

##### Enforcement

Code review.

<!-- </rule> -->

<!-- <rule> -->

### Rule: Precede section header comments with two blank lines

##### Reason

Section header comments (e.g., `// MAIN //`, `// VARIABLES //`) delimit
logical regions of a file. Two blank lines create a stronger visual break
than a single blank line, making it easier to navigate the file.

##### Bad Example

```c
// Do not...
// VARIABLES //

static const double ONE = 1.0;

// MAIN //

double stdlib_base_abs( const double x ) {
    // ...
}
```

##### Good Example

```c
// Do...
// VARIABLES //

static const double ONE = 1.0;


// MAIN //

double stdlib_base_abs( const double x ) {
    // ...
}
```

##### Enforcement

Code review.

<!-- </rule> -->

<!-- </rule-set> -->

<!-- <rule-set> -->

* * *

## File Structure

<!-- <rule> -->

### Rule: Begin every file with an Apache-2.0 license block

##### Reason

All stdlib source files must carry an explicit copyright notice and license
declaration. This protects contributors and consumers, and is a project
requirement for all committed files.

##### Bad Example

```c
// Do not...
#ifndef STDLIB_MATH_BASE_SPECIAL_ABS_H
#define STDLIB_MATH_BASE_SPECIAL_ABS_H

double stdlib_base_abs( const double x );

#endif // !STDLIB_MATH_BASE_SPECIAL_ABS_H
```

##### Good Example

```c
// Do...

/**
* @license Apache-2.0
*
* Copyright (c) 2026 The Stdlib Authors.
*
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*    http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

#ifndef STDLIB_MATH_BASE_SPECIAL_ABS_H
#define STDLIB_MATH_BASE_SPECIAL_ABS_H

double stdlib_base_abs( const double x );

#endif // !STDLIB_MATH_BASE_SPECIAL_ABS_H
```

##### Enforcement

`make lint-license-headers`

<!-- </rule> -->

<!-- <rule> -->

### Rule: Order includes: own header first, then stdlib headers, then system headers

##### Reason

Including a file's own header first ensures that the header is self-contained
(i.e., it does not silently depend on includes from other translation units).
Placing system headers last prevents system macros from polluting the stdlib
namespace.

##### Bad Example

```c
// Do not...
#include <stdint.h>
#include "stdlib/blas/base/shared.h"
#include "stdlib/blas/ext/base/dapxsum.h"
```

##### Good Example

```c
// Do...
#include "stdlib/blas/ext/base/dapxsum.h"
#include "stdlib/blas/base/shared.h"
#include <stdint.h>
```

##### Enforcement

Code review.

<!-- </rule> -->

<!-- <rule> -->

### Rule: All files must end with a single trailing newline

##### Reason

POSIX defines a text file as a sequence of lines, each terminated by a
newline character. Missing or multiple trailing newlines cause noisy diffs
and may confuse tools that process text files.

##### Bad Example

```c
// Do not... (no trailing newline, or multiple trailing newlines)
double stdlib_base_abs( const double x ) {
    return ( x < 0.0 ) ? -x : x;
}
```

##### Good Example

```c
// Do... (exactly one newline at end of file)
double stdlib_base_abs( const double x ) {
    return ( x < 0.0 ) ? -x : x;
}
```

##### Enforcement

`.editorconfig`

<!-- </rule> -->

<!-- </rule-set> -->

<!-- <rule-set> -->

* * *

## Include Guards

<!-- <rule> -->

### Rule: Use `#ifndef` / `#define` / `#endif` include guards in all headers

##### Reason

Include guards prevent a header from being processed more than once per
translation unit, avoiding duplicate definition errors when headers are
transitively included from multiple files.

##### Bad Example

```c
// Do not...
// (header with no include guard)
#include "stdlib/blas/base/shared.h"

double stdlib_base_abs( const double x );
```

##### Good Example

```c
// Do...
#ifndef STDLIB_MATH_BASE_SPECIAL_ABS_H
#define STDLIB_MATH_BASE_SPECIAL_ABS_H

#include "stdlib/blas/base/shared.h"

double stdlib_base_abs( const double x );

#endif // !STDLIB_MATH_BASE_SPECIAL_ABS_H
```

##### Enforcement

Code review.

<!-- </rule> -->

<!-- <rule> -->

### Rule: Name guard macros `STDLIB_<DOMAIN>_<PATH>_H`

##### Reason

A consistent, globally unique macro name derived from the file's path prevents
accidental collisions between guards in different packages.

##### Bad Example

```c
// Do not...
#ifndef MY_HEADER_H
#define MY_HEADER_H
// ...
#endif
```

##### Good Example

```c
// Do...
#ifndef STDLIB_BLAS_EXT_BASE_DAPXSUM_H
#define STDLIB_BLAS_EXT_BASE_DAPXSUM_H
// ...
#endif // !STDLIB_BLAS_EXT_BASE_DAPXSUM_H
```

##### Notes

-   Convert the header's path relative to the `include/` directory to
    uppercase and replace `/` and `.` with `_`.

-   For example, `include/stdlib/blas/ext/base/dapxsum.h` becomes
    `STDLIB_BLAS_EXT_BASE_DAPXSUM_H`.

##### Enforcement

Code review.

<!-- </rule> -->

<!-- <rule> -->

### Rule: Close `#endif` with a `// !STDLIB_..._H` comment

##### Reason

`#endif` directives at the end of long header files can be hard to associate
with their matching `#ifndef`. A trailing comment makes the relationship
explicit and helps readers verify that the guard is correctly closed.

##### Bad Example

```c
// Do not...
#ifndef STDLIB_BLAS_EXT_BASE_DAPXSUM_H
#define STDLIB_BLAS_EXT_BASE_DAPXSUM_H

// ...

#endif
```

##### Good Example

```c
// Do...
#ifndef STDLIB_BLAS_EXT_BASE_DAPXSUM_H
#define STDLIB_BLAS_EXT_BASE_DAPXSUM_H

// ...

#endif // !STDLIB_BLAS_EXT_BASE_DAPXSUM_H
```

##### Enforcement

Code review.

<!-- </rule> -->

<!-- </rule-set> -->

<!-- <rule-set> -->

* * *

## C++ Compatibility

<!-- <rule> -->

### Rule: Wrap public header declarations in `extern "C"` guards

##### Reason

When a C header is included in a C++ translation unit, the C++ compiler will
mangle function names by default. Wrapping declarations in `extern "C"`
prevents name mangling, allowing C++ code to link against C implementations
without errors.

##### Bad Example

```c
// Do not...
#ifndef STDLIB_MATH_BASE_SPECIAL_ABS_H
#define STDLIB_MATH_BASE_SPECIAL_ABS_H

double stdlib_base_abs( const double x );

#endif // !STDLIB_MATH_BASE_SPECIAL_ABS_H
```

##### Good Example

```c
// Do...
#ifndef STDLIB_MATH_BASE_SPECIAL_ABS_H
#define STDLIB_MATH_BASE_SPECIAL_ABS_H

#ifdef __cplusplus
extern "C" {
#endif

double stdlib_base_abs( const double x );

#ifdef __cplusplus
}
#endif

#endif // !STDLIB_MATH_BASE_SPECIAL_ABS_H
```

##### Enforcement

Code review.

<!-- </rule> -->

<!-- <rule> -->

### Rule: Use `#ifdef __cplusplus` to guard `extern "C"` blocks

##### Reason

The `extern "C"` syntax is not valid C. Guarding it with `#ifdef __cplusplus`
ensures the header remains valid C while also being safe to include from C++.

##### Bad Example

```c
// Do not...
extern "C" {
double stdlib_base_abs( const double x );
}
```

##### Good Example

```c
// Do...
#ifdef __cplusplus
extern "C" {
#endif

double stdlib_base_abs( const double x );

#ifdef __cplusplus
}
#endif
```

##### Enforcement

Code review.

<!-- </rule> -->

<!-- </rule-set> -->

<!-- <rule-set> -->

* * *

## Variables and Types

<!-- <rule> -->

### Rule: Declare all variables at the top of their scope

##### Reason

Stdlib C targets C89 compatibility, which requires all variable declarations
to precede any statements within a block. Declaring variables at the top of
the function also makes it easy to see at a glance what values a function
manages.

##### Bad Example

```c
// Do not...
double stdlib_base_abs( const double x ) {
    if ( x < 0.0 ) {
        double y = -x;
        return y;
    }
    return x;
}
```

##### Good Example

```c
// Do...
double stdlib_base_abs( const double x ) {
    double y;

    if ( x < 0.0 ) {
        y = -x;
        return y;
    }
    return x;
}
```

##### Enforcement

Code review.

<!-- </rule> -->

<!-- <rule> -->

### Rule: Declare one variable per line

##### Reason

Declaring multiple variables on a single line makes the code harder to read
and complicates adding per-variable comments or annotations in the future.

##### Bad Example

```c
// Do not...
double x, y, z;
int32_t i, n;
```

##### Good Example

```c
// Do...
double x;
double y;
double z;
int32_t i;
int32_t n;
```

##### Enforcement

Code review.

<!-- </rule> -->

<!-- <rule> -->

### Rule: Use fixed-width integer types

##### Reason

The sizes of `int`, `long`, and related types are platform-defined. Using
fixed-width types from `<stdint.h>` (e.g., `int32_t`, `int64_t`, `uint32_t`)
produces portable code whose integer sizes are guaranteed regardless of the
target platform or compiler.

##### Bad Example

```c
// Do not...
int n = 100;
long offset = 0;
unsigned int count = 0;
```

##### Good Example

```c
// Do...
int32_t n = 100;
int64_t offset = 0;
uint32_t count = 0;
```

##### Enforcement

Code review.

<!-- </rule> -->

<!-- <rule> -->

### Rule: Use `CBLAS_INT` for array indices and counts in BLAS contexts

##### Reason

BLAS interfaces may be compiled with either 32-bit or 64-bit integer support.
`CBLAS_INT` is an alias that resolves to the correct integer type for the
current build configuration, ensuring compatibility with both ILP64 and LP64
BLAS builds.

##### Bad Example

```c
// Do not...
double stdlib_strided_dsum( const int N, const double *X, const int strideX );
```

##### Good Example

```c
// Do...
double API_SUFFIX(stdlib_strided_dsum)( const CBLAS_INT N, const double *X, const CBLAS_INT strideX );
```

##### Enforcement

Code review.

<!-- </rule> -->

<!-- <rule> -->

### Rule: Use the `f` suffix on single-precision floating-point literals

##### Reason

An unsuffixed floating-point literal such as `1.0` has type `double`. Assigning
or operating on a `float` variable with a `double` literal causes an implicit
promotion to `double` and then a truncation back to `float`, which may
introduce subtle precision differences and prevents the compiler from using
single-precision instructions.

##### Bad Example

```c
// Do not... (silently promotes to double, then truncates)
float x = 1.0;
float y = x + 0.5;
```

##### Good Example

```c
// Do...
float x = 1.0f;
float y = x + 0.5f;
```

##### Enforcement

Code review.

<!-- </rule> -->

<!-- <rule> -->

### Rule: Declare variables in order of decreasing name length

##### Reason

Declaring variables in decreasing order of name length produces a natural
alignment of the identifiers and their types without requiring manual spacing,
making the declaration block easier to scan.

##### Bad Example

```c
// Do not...
CBLAS_INT strideX;
double alpha;
CBLAS_INT N;
CBLAS_INT ox;
```

##### Good Example

```c
// Do...
CBLAS_INT strideX;
CBLAS_INT ox;
CBLAS_INT N;
double alpha;
```

##### Enforcement

Code review.

<!-- </rule> -->

<!-- </rule-set> -->

<!-- <rule-set> -->

* * *

## Naming

<!-- TODO -->

<!-- </rule-set> -->

<!-- <rule-set> -->

* * *

## Functions

<!-- TODO -->

<!-- </rule-set> -->

<!-- <rule-set> -->

* * *

## Comments

<!-- TODO -->

<!-- </rule-set> -->

<!-- <rule-set> -->

* * *

## Error Handling

<!-- TODO -->

<!-- </rule-set> -->

<!-- <rule-set> -->

* * *

## Portability

<!-- TODO -->

<!-- </rule-set> -->

<!-- <rule-set> -->

* * *

## Node-API Addons

<!-- TODO -->

<!-- </rule-set> -->

* * *

## Additional Resources

<!-- TODO -->

* * *

## License

<!-- TODO -->

<section class="links">

</section>

<!-- /.links -->
