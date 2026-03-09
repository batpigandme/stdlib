<!--

@license Apache-2.0

Copyright (c) 2017 The Stdlib Authors.

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

# Test Fixtures

> Test fixture recipes.

<!-- Section to include introductory text. Make sure to keep an empty line after the intro `section` element and another before the `/section` close. -->

<section class="intro">

This directory contains [`make`][make] recipes for generating test fixtures.

</section>

<!-- /.intro -->

<!-- Usage documentation. -->

<section class="usage">

## Usage

```text
Usage: make <command> [<ENV_VAR>=<value> <ENV_VAR>=<value> ...]
```

### Commands

#### test-fixtures

Generates test fixtures across all supported languages (C, C++, Fortran, Julia, Python, and R).

<!-- run-disable -->

```bash
$ make test-fixtures
```

* * *

### C

#### test-fixtures-c

Runs scripts written in C to generate test fixtures.

<!-- run-disable -->

```bash
$ make test-fixtures-c
```

#### test-fixtures-c-files

Runs a specified list of scripts written in C to generate test fixtures.

<!-- run-disable -->

```bash
$ make test-fixtures-c-files FILES='/path/to/fixture/runner1 /path/to/fixture/runner2'
```

The command requires the following environment variables:

-   **FILES**: list of script file paths.

* * *

### C++

#### test-fixtures-cpp

Runs scripts written in C++ to generate test fixtures.

<!-- run-disable -->

```bash
$ make test-fixtures-cpp
```

#### test-fixtures-cpp-files

Runs a specified list of scripts written in C++ to generate test fixtures.

<!-- run-disable -->

```bash
$ make test-fixtures-cpp-files FILES='/path/to/fixture/runner1 /path/to/fixture/runner2'
```

The command requires the following environment variables:

-   **FILES**: list of script file paths.

* * *

### Fortran

#### test-fixtures-fortran

Runs scripts written in Fortran to generate test fixtures.

<!-- run-disable -->

```bash
$ make test-fixtures-fortran
```

#### test-fixtures-fortran-files

Runs a specified list of scripts written in Fortran to generate test fixtures.

<!-- run-disable -->

```bash
$ make test-fixtures-fortran-files FILES='/path/to/fixture/runner1 /path/to/fixture/runner2'
```

The command requires the following environment variables:

-   **FILES**: list of script file paths.

* * *

### Julia

#### test-fixtures-julia

Runs scripts written in Julia to generate test fixtures.

<!-- run-disable -->

```bash
$ make test-fixtures-julia
```

#### test-fixtures-julia-files

Runs a specified list of scripts written in Julia to generate test fixtures.

<!-- run-disable -->

```bash
$ make test-fixtures-julia-files FILES='/path/to/fixture/runner1 /path/to/fixture/runner2'
```

The command requires the following environment variables:

-   **FILES**: list of script file paths.

* * *

### Python

#### test-fixtures-python

Runs scripts written in Python to generate test fixtures.

<!-- run-disable -->

```bash
$ make test-fixtures-python
```

#### test-fixtures-python-files

Runs a specified list of scripts written in Python to generate test fixtures.

<!-- run-disable -->

```bash
$ make test-fixtures-python-files FILES='/path/to/fixture/runner1 /path/to/fixture/runner2'
```

The command requires the following environment variables:

-   **FILES**: list of script file paths.

* * *

### R

#### test-fixtures-r

Runs scripts written in R to generate test fixtures.

<!-- run-disable -->

```bash
$ make test-fixtures-r
```

#### test-fixtures-r-files

Runs a specified list of scripts written in R to generate test fixtures.

<!-- run-disable -->

```bash
$ make test-fixtures-r-files FILES='/path/to/fixture/runner1 /path/to/fixture/runner2'
```

The command requires the following environment variables:

-   **FILES**: list of script file paths.

</section>

<!-- /.usage -->

<!-- Section to include notes. Make sure to keep an empty line after the `section` element and another before the `/section` close. -->

* * *

<section class="notes">

## Notes

-   The `test-fixtures-<lang>-files` commands are useful when wanting to regenerate fixtures for a specific subset of fixture runner scripts, rather than discovering and running all scripts of a given language.

</section>

<!-- /.notes -->

<section class="examples">

</section>

<!-- /.examples -->

<!-- Section for all links. Make sure to keep an empty line after the `section` element and another before the `/section` close. -->

<section class="links">

[make]: https://www.gnu.org/software/make/

</section>

<!-- /.links -->
