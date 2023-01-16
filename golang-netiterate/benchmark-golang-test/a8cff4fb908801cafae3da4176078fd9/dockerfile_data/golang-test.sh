#!/bin/bash

out=$1
res=$(grep -c -i "127.0.0.1/8" $out)

if [ $res -eq "1" ]; then
    exit 0
fi

exit 1