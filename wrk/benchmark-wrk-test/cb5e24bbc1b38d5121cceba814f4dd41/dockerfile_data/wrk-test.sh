#!/bin/bash

sleep 4
out=$1
res=$(grep -c -i "wrk debian/4.1.0" $out)

if [ $res -eq "0" ]; then
    exit 1
fi

exit 0