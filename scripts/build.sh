#!/bin/bash

export RUSTFLAGS="-Ccodegen-units=1"

rustup default stable

cargo install cross

platforms=(
'aarch64-unknown-linux-gnu'
'armv7-linux-androideabi'
'arm-unknown-linux-gnueabi'
'arm-unknown-linux-gnueabihf'
'aarch64-linux-android'
)

for platform in ${platforms[*]}
do
  mkdir -p ./libs/${platform}
  pushd zerokit/rln
  cargo clean
  cross build --release --lib --target=${platform}
  cp ../target/${platform}/release/librln.a ../../libs/${platform}/.
  popd
done




