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

<!-- TODO -->

<!-- </rule-set> -->

<!-- <rule-set> -->

* * *

## File Structure

<!-- TODO -->

<!-- </rule-set> -->

<!-- <rule-set> -->

* * *

## Include Guards

<!-- TODO -->

<!-- </rule-set> -->

<!-- <rule-set> -->

* * *

## C++ Compatibility

<!-- TODO -->

<!-- </rule-set> -->

<!-- <rule-set> -->

* * *

## Variables and Types

<!-- TODO -->

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
