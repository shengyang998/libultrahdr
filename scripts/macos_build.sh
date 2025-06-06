#!/bin/bash
set -e
ARCH="$1"
if [[ "$ARCH" != "arm64" && "$ARCH" != "x86_64" ]]; then
  echo "Usage: $0 [arm64|x86_64]" >&2
  exit 1
fi
ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
BUILD_DIR="$ROOT_DIR/build_${ARCH}"
mkdir -p "$BUILD_DIR"
cmake -G Ninja -S "$ROOT_DIR" -B "$BUILD_DIR" -DCMAKE_OSX_ARCHITECTURES=$ARCH -DUHDR_WRITE_XMP=ON -DUHDR_WRITE_ISO=ON -DUHDR_BUILD_TESTS=0
cmake --build "$BUILD_DIR" --target ultrahdr_app
