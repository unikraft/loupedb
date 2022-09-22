#!/bin/bash

DIR=`mktemp -d`
mv /root/zstd-test/zstd.tar.zst $DIR

cd $DIR && /root/zstd-1.5.0/zstd -d zstd.tar.zst && tar xf zstd.tar

if [ -f "$DIR/zstd-1.5.0/README.md" ]; then
    exit 0
fi

exit 1