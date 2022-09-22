#!/bin/bash

DIR=`mktemp -d`
cat $1 > $DIR/compressed.tar.lzma

cd $DIR && tar xf compressed.tar.lzma

if [ -f "$DIR/lzma-4.32.7/README" ]; then
    exit 0
fi

exit 1