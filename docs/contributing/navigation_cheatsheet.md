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

# Navigation Cheatsheet

> Quick reference for finding and working with packages in stdlib.

For detailed explanations, see the [navigating the codebase][stdlib-navigating] guide.

## Discovering Packages

<!-- run-disable -->

```bash
# List all package names:
$ make list-pkgs-names

# List all top-level namespaces:
$ make list-pkgs-namespaces

# Find packages matching a pattern:
$ PACKAGES_FILTER=".*/math/base/special/.*" make list-lib-pkgs

# Display the package tree:
$ make list-pkgs-tree
```

## Running Package Tasks

<!-- run-disable -->

```bash
# Run tests for a specific package:
$ make TESTS_FILTER=".*/math/base/special/sin/.*" test

# Run examples for a specific package:
$ make EXAMPLES_FILTER=".*/math/base/special/sin/.*" examples

# Run benchmarks for a specific package:
$ make BENCHMARKS_FILTER=".*/math/base/special/sin/.*" benchmark
```

## Looking Up Packages

| Task                                  | Where to look                                               |
| ------------------------------------- | ----------------------------------------------------------- |
| Resolve an alias to a package path.   | `lib/node_modules/@stdlib/namespace/alias2pkg/`             |
| Find a package alias.                 | `lib/node_modules/@stdlib/namespace/pkg2alias/`             |
| Find related packages.                | `lib/node_modules/@stdlib/namespace/pkg2related/`           |
| Browse all aliases.                   | `lib/node_modules/@stdlib/namespace/aliases/data/data.txt`  |

## Key Paths

| What                           | Path                                  |
| ------------------------------ | ------------------------------------- |
| All packages.                  | `lib/node_modules/@stdlib/`           |
| Build tools.                   | `tools/`                              |
| Internal development tools.    | `lib/node_modules/@stdlib/_tools/`    |
| Configuration files.           | `etc/`                                |
| Contributing guides.           | `docs/contributing/`                  |
| Style guides.                  | `docs/style-guides/`                  |
| Editor setup.                  | `docs/editors/`                       |

<section class="links">

[stdlib-navigating]: https://github.com/stdlib-js/stdlib/blob/develop/docs/contributing/navigating_the_codebase.md

</section>

<!-- /.links -->
