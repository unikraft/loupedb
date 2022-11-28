#!/bin/bash

out=$1
res=$(grep -c -i "mruby 3.0.0" $out)

if [ $res -eq "0" ]; then
    exit 1
fi

exit 0