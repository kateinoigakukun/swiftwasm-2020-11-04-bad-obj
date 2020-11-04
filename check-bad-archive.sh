#!/bin/bash
set -eu

archive_path=$(cd $(dirname $1) && pwd)/$(basename $1)
workdir="$(mktemp -d)"
cd "$workdir"

llvm-ar x $archive_path

if wasm-objdump -h $workdir/magic-symbols-for-install-name.c.o >> /dev/null 2>&1; then
  :
else
  echo "Bad archive!"
  exit 1
fi
