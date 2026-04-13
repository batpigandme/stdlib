#/
# @license Apache-2.0
#
# Copyright (c) 2026 The Stdlib Authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#/

# TARGETS #

# Build the package catalog.
#
# This target generates a JSON catalog mapping package names to metadata
# (alias, description, type, related packages, and capability flags).

namespace-packages: $(NODE_MODULES) $(SRC_DIR)/@stdlib/namespace/packages/scripts/build.js
	$(QUIET) $(NODE) "$(SRC_DIR)/@stdlib/namespace/packages/scripts/build.js"

.PHONY: namespace-packages
