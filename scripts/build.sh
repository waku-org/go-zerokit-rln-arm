#!/bin/bash

export RUSTFLAGS="-Ccodegen-units=1"

rustup default stable

cargo install cross --git https://github.com/cross-rs/cross --branch main

pushd zerokit/rln

cargo clean

cross build --release --lib --target=aarch64-unknown-linux-gnu
cross build --release --lib --target=armv7-linux-androideabi
#cross build --release --lib --target=arm-unknown-linux-gnueabi
#cross build --release --lib --target=arm-unknown-linux-gnueabihf
#cross build --release --lib --target=aarch64-linux-android

popd

DIRECTORY=./libs
TOOLS_DIR=`dirname $0`
COMPILE_DIR=${TOOLS_DIR}/../zerokit/target
for platform in `ls ${COMPILE_DIR} | grep -v release | grep -v debug | grep -v CACHEDIR.TAG`
do
  PLATFORM_DIR=${DIRECTORY}/$platform
  mkdir -p ${PLATFORM_DIR}
  cp ${COMPILE_DIR}/$platform/release/librln.a ${PLATFORM_DIR}
done
