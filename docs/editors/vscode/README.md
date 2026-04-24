<!--

@license Apache-2.0

Copyright (c) 2018 The Stdlib Authors.

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

# Visual Studio Code

> A guide for using [Visual Studio Code][vscode] for project development.

[Visual Studio Code][vscode] is a free source code editor that is available for use on Linux, MacOS, and Windows.

## Installation

Pre-built binaries are available for download on the Visual Studio Code [homepage][vscode].

To use [Visual Studio Code][vscode] as a command-line utility, users on MacOS have to run a command to add the [Visual Studio Code][vscode] executable to the `PATH` environment variable (see the official [documentation][vscode-macos-setup]). 

To test the command-line utility,

```bash
$ code --help
```

To open a project in [Visual Studio Code][vscode],

```bash
$ cd ./path/to/project
$ code .
```

## Extensions

### Required

-   [**EditorConfig**][vscode-editorconfig]: extension for using [EditorConfig][editorconfig], which automatically applies the project's indentation, line ending, and whitespace settings. This extension is required for all contributors regardless of which languages they work with.

### Optional

The following extensions are useful depending on which parts of the codebase you work with. Install only what you need.

#### JavaScript

-   [**ESLint**][vscode-eslint]: extension to integrate [eslint][eslint] into [Visual Studio Code][vscode]. Once installed, configure the extension to use the project [ESLint][eslint] configuration files in your workspace settings.

    ```text
            ...
            "eslint.options": {
                "configFile": "etc/eslint/.eslintrc.js"
            }
            ...
    ```

#### C/C++

-   [**C/C++**][vscode-cpptools]: official extension providing language support for C/C++ to [Visual Studio Code][vscode]. Features include IntelliSense, debugging, and code browsing.

#### Fortran

-   [**Fortran**][vscode-fortran]: extension which provides syntax highlighting and snippets for [Fortran][fortran]. Once installed, configure [Visual Studio Code][vscode] to always open files having the file extension `*.f` as `Fortran - Modern` in your user or workspace settings.

    ```text
            ...
            "files.associations": {
                "*.f": "fortran-modern"
            }
            ...
    ```

#### Python

-   [**Python**][vscode-python]: extension which provides rich support for [Python][python], including syntax highlighting, snippets, and code completion, among other features.

#### Julia

-   [**Julia**][vscode-julia]: extension which provides support for [Julia][julia], including syntax highlighting, snippets, and code completion.

#### AWK

-   [**AWK**][vscode-awk]: extension which provides syntax highlighting for [AWK][awk].

#### General

-   [**JSON Tools**][vscode-json-tools]: extension for pretty printing and minifying [JSON][json].

-   [**Code Spell Checker**][vscode-spell-checker]: A simple source code spell checker. See the [official documentation][vscode-spell-checker-readme] for configuration options.

-   [**Path Intellisense**][vscode-path-intellisense]: extension that autocompletes filenames.

-   [**Runner**][vscode-runner]: extension allowing one to run various scripts from the editor.

-   [**TODO Highlight**][vscode-todo-highlight]: extension which marks annotations such as `TODO`, `FIXME`, etc. Once installed, you may configure the extension to your liking in your user or workspace settings, e.g. by specifying the list of keywords to be highlighted.

    ```text
            ...
            "todohighlight.keywords": [
                {
                    "text": "FIXME:",
                    "color": "white",
                    "backgroundColor": "red",
                    "isWholeLine": true
                },
                {
                    "text": "HACK:",
                    "color": "darkgreen",
                    "isWholeLine": true,
                },
                {
                    "text": "NOTE:",
                    "color": "darkgreen",
                    "backgroundColor": "rgba(0,0,0,.2)",
                    "overviewRulerColor": "grey",
                    "isWholeLine": true
                },
                {
                    "text": "OPTIMIZE:",
                    "isWholeLine": true
                },
                {
                    "text": "TODO:",
                    "color": "darkred",
                    "backgroundColor": "rgba(0,0,0,.2)", 
                    "isWholeLine": true
                },
                {
                    "text": "WARNING:",
                    "color": "black",
                    "backgroundColor": "orange",
                    "isWholeLine": true
                }
            ]
            ...
    ```

## Performance

Because the project contains over 300,000 files, [Visual Studio Code][vscode] may struggle with file watching, search indexing, and general responsiveness without proper configuration. Add the following to your workspace settings (`.vscode/settings.json`) to exclude heavy directories from the file watcher and search index while keeping the main source code under `lib/node_modules/@stdlib/` fully indexed.

```json
{
    "files.watcherExclude": {
        "**/deps/**": true,
        "**/dist/**": true,
        "**/node_modules/.cache/**": true,
        "**/build/**": true,
        "**/.git/**": true
    },
    "search.exclude": {
        "**/deps/**": true,
        "**/dist/**": true,
        "**/node_modules/.cache/**": true,
        "**/build/**": true
    }
}
```

If you experience further performance issues, add additional paths to `files.watcherExclude` and `search.exclude` in your workspace settings.

For focused development on a specific package, consider opening only the package subdirectory (e.g., `lib/node_modules/@stdlib/math/base/special/sin`) in a separate [Visual Studio Code][vscode] window. This dramatically reduces the number of files that [Visual Studio Code][vscode] needs to track and results in faster search and IntelliSense.

<section class="links">

[vscode]: https://code.visualstudio.com/

[vscode-macos-setup]: https://code.visualstudio.com/docs/setup/mac

[vscode-eslint]: https://github.com/Microsoft/vscode-eslint

[vscode-spell-checker]: https://github.com/Jason-Rev/vscode-spell-checker

[vscode-spell-checker-readme]: https://github.com/Jason-Rev/vscode-spell-checker/blob/master/client/README.md

[vscode-path-intellisense]: https://github.com/ChristianKohler/PathIntellisense

[vscode-todo-highlight]: https://github.com/wayou/vscode-todo-highlight

[vscode-editorconfig]: https://github.com/editorconfig/editorconfig-vscode

[vscode-json-tools]: https://marketplace.visualstudio.com/items?itemName=eriklynd.json-tools#overview

[vscode-python]: https://github.com/Microsoft/vscode-python

[vscode-julia]: https://github.com/JuliaEditorSupport/julia-vscode

[vscode-awk]: https://github.com/luggage66/vscode-awk

[vscode-cpptools]: https://marketplace.visualstudio.com/items?itemName=ms-vscode.cpptools

[vscode-fortran]: https://github.com/Gimly/vscode-fortran

[vscode-runner]: https://github.com/mattn/vscode-runner

[eslint]: https://eslint.org/

[json]: http://www.json.org/

[editorconfig]: http://editorconfig.org/

[python]: https://www.python.org/

[julia]: https://julialang.org/

[awk]: https://en.wikipedia.org/wiki/AWK

[fortran]: https://en.wikipedia.org/wiki/Fortran

</section>

<!-- /.links -->
