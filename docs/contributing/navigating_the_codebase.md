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

# Navigating the Codebase

> A guide for finding packages, understanding the namespace hierarchy, and discovering related functionality in stdlib.

## Introduction

stdlib is a large monorepo containing over 300,000 files. Standard tools such as GitHub code search and IDE indexers may struggle at this scale. This guide covers strategies for efficiently finding what you need.

For setting up a development environment, see the [development guide][stdlib-development]. For creating new packages, see the [packages guide][stdlib-packages].

## Packages and Build Tools

All stdlib packages live under `lib/node_modules/@stdlib/`. Each package is fully decomposable and can be independently consumed. Build tools, configuration, and development utilities live outside this directory:

```text
lib/node_modules/@stdlib/         packages (source code, tests, benchmarks, docs)
lib/node_modules/@stdlib/_tools/  internal development tools (package analysis, search indexing, etc.)
tools/                            development utilities and scripts
etc/                              configuration files (ESLint, JSDoc, remark, etc.)
deps/                             external library dependencies
dist/                             distributable files
```

For a complete overview of the top-level directory layout, see the "Organization" section of the [development guide][stdlib-development].

## The Namespace Hierarchy

Packages are organized into top-level namespaces. Each namespace groups related functionality:

| Namespace     | Description                                     |
| ------------- | ----------------------------------------------- |
| `array`       | Array utilities and typed arrays.               |
| `assert`      | Assertion utilities.                            |
| `bench`       | Benchmark harness.                              |
| `bigint`      | BigInt utilities.                               |
| `blas`        | BLAS (Basic Linear Algebra Subprograms).        |
| `boolean`     | Boolean utilities.                              |
| `buffer`      | Buffer utilities.                               |
| `cli`         | Command-line interface utilities.               |
| `complex`     | Complex number support.                         |
| `console`     | Debugger console.                               |
| `constants`   | Mathematical and scientific constants.          |
| `datasets`    | Standard datasets.                              |
| `dstructs`    | Data structures.                                |
| `error`       | Error utilities.                                |
| `fft`         | Fast Fourier Transform.                         |
| `fs`          | Filesystem APIs.                                |
| `function`    | Function utilities.                             |
| `iter`        | Iterator utilities.                             |
| `lapack`      | LAPACK routines.                                |
| `math`        | Mathematical functions.                         |
| `ml`          | Machine learning algorithms.                    |
| `namespace`   | Library namespace, aliases, and package maps.   |
| `napi`        | C APIs for creating Node-API native add-ons.    |
| `ndarray`     | Multidimensional arrays.                        |
| `net`         | Networking.                                     |
| `nlp`         | Natural language processing.                    |
| `number`      | Number utilities.                               |
| `object`      | Object utilities.                               |
| `os`          | OS utilities.                                   |
| `plot`        | Plotting.                                       |
| `process`     | Process utilities.                              |
| `proxy`       | Proxy utilities.                                |
| `random`      | Pseudorandom number generators.                 |
| `regexp`      | Regular expression utilities.                   |
| `repl`        | REPL environment.                               |
| `simulate`    | Simulation utilities.                           |
| `slice`       | Slice utilities.                                |
| `stats`       | Statistical functions.                          |
| `streams`     | Node.js stream utilities.                       |
| `strided`     | Strided array operations.                       |
| `string`      | String manipulation functions.                  |
| `symbol`      | Symbol utilities.                               |
| `time`        | Time utilities.                                 |
| `types`       | TypeScript type declarations.                   |
| `utils`       | General-purpose utilities.                      |
| `wasm`        | WebAssembly utilities.                          |

### Naming Convention

Package paths follow a hierarchical naming convention where each level narrows the scope. For example:

```text
@stdlib/math/base/special/sin
         │    │     │      └── the specific function
         │    │     └── category (special functions)
         │    └── subcategory (base implementations)
         └── top-level namespace
```

The `base` level in namespaces such as `math`, `random`, and `stats` typically denotes low-level implementations that are not intended to be used directly in most application code but serve as building blocks for higher-level APIs.

## Finding Packages

### Using Make Targets

The project provides several Make targets for discovering packages:

<!-- run-disable -->

```bash
$ make list-pkgs-names
```

Lists all package names in the project.

To find packages matching a specific pattern:

<!-- run-disable -->

```bash
$ PACKAGES_FILTER=".*/math/base/special/.*" make list-lib-pkgs
```

To list all top-level namespaces:

<!-- run-disable -->

```bash
$ make list-pkgs-namespaces
```

### Using the REPL

The stdlib REPL provides built-in help and search capabilities:

<!-- run-disable -->

```bash
$ node -e "var repl = require('@stdlib/repl'); var r = repl();"
```

Within the REPL, use `help()` to display documentation for any function or alias.

### Using Alias Resolution

stdlib maintains a mapping between short aliases and full package paths. The alias data is stored in `lib/node_modules/@stdlib/namespace/`:

-   **`alias2pkg`**: resolve an alias (e.g., `abs`) to its full package path (e.g., `@stdlib/math/base/special/abs`.)
-   **`pkg2alias`**: reverse lookup, from a package path to its alias.

The raw alias data is available in both JSON and plain text formats under `lib/node_modules/@stdlib/namespace/aliases/data/`.

## Understanding Package Relationships

### Related Packages

The `lib/node_modules/@stdlib/namespace/pkg2related/` directory contains mappings from each package to its related packages. The data is available in JSON and CSV formats under the `data/` subdirectory.

For example, `@stdlib/array/cartesian-power` is related to `@stdlib/array/cartesian-product` and `@stdlib/array/cartesian-square`.

### Package Dependencies

For dependency analysis, the project includes tools under `lib/node_modules/@stdlib/_tools/pkgs/`:

-   **`deps`**: find package dependencies.
-   **`tree`**: build a package dependency tree.
-   **`toposort`**: topologically sort packages by their dependencies.

## Editor Configuration

For guidance on configuring your editor for this project, see the [editor setup guides][stdlib-editors]. The project includes VS Code workspace settings in `.vscode/` that configure the file watcher and search index for large-repo performance.

<section class="links">

[stdlib-development]: https://github.com/stdlib-js/stdlib/blob/develop/docs/contributing/development.md

[stdlib-packages]: https://github.com/stdlib-js/stdlib/blob/develop/docs/contributing/packages.md

[stdlib-editors]: https://github.com/stdlib-js/stdlib/blob/develop/docs/editors/

</section>

<!-- /.links -->
