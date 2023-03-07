#!/bin/bash
set -e
THIS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/" >/dev/null 2>&1 && pwd )"

pushd $THIS_DIR >/dev/null

BUILD_PLATFORM=${1:-'wasm'}
BUILD_CONFIG=${2:-'release'}

BUILD_DIR=build_${BUILD_PLATFORM}_${BUILD_CONFIG}

# Clean-up
rm -f $BUILD_DIR/v3d-wasm.js*

if [ $BUILD_PLATFORM == "wasm" ]; then
    echo 'Running wasm build ... '
    emcmake cmake -G Ninja -B$BUILD_DIR \
        -DCMAKE_BUILD_TYPE=${BUILD_CONFIG} .
fi

if [ $BUILD_PLATFORM == "x64" ]; then
    echo 'Running x64 build ... '
    cmake -G Ninja -B$BUILD_DIR \
        -DCMAKE_BUILD_TYPE=${BUILD_CONFIG} .
fi

ninja -C $BUILD_DIR

if [ $BUILD_PLATFORM == "wasm" ]; then
    cp $BUILD_DIR/v3d-*.wasm* .
    cp $BUILD_DIR/v3d-*.js* .

    node $THIS_DIR/tools/bundle-with-wasm.js

    #cp $BUILD_DIR/v3d-*.wasm* example/
    cp ./v3d-wasm.all.js example/
fi

ln -sf $BUILD_DIR/compile_commands.json $THIS_DIR/compile_commands.json

popd >/dev/null