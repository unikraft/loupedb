#!/bin/bash

DIR=`mktemp -d`
cat $1 > $DIR/compressed.tar.bzip2

cd $DIR && tar xf compressed.tar.bzip2

if [ -f "$DIR/bzip2-1.0.8/README" ]; then
    exit 0
fi

exit 1