#!/bin/bash

out=$1
res=$(grep -c -i "test" $out)

if [ $res -eq "1" ]; then
    exit 0
fi

exit 1