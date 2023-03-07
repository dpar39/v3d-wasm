#!/usr/bin/env bash
# This command can be run by the user to clang-format everything.
THIS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
pushd "$THIS_DIR" > /dev/null
CHECK_DIRS=()
for DIR in "include" "src" "tests"; do [ -d "$THIS_DIR/../$DIR" ] && CHECK_DIRS+=("$DIR") ; done
find ${CHECK_DIRS[@]} \
    \( -name '*.cpp' -o -name '*.h' -o -name '*.hpp' \) \
    -not -name pugi* -not -name json.hpp -not -path '*/third-party/*' \
    -print0 \
    | xargs -n1 -0 clang-format -style=file -i
popd > /dev/null
