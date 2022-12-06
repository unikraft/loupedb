#!/bin/bash

out=$1
res=$(grep -c -i "Version" $out)

if [ $res -eq "0" ]; then
    exit 1
fi

exit 0