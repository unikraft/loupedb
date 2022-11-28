#!/bin/bash

out=$1
res=$(grep -c -i "Netperf version 2.7.0" $out)

if [ $res -eq "0" ]; then
    exit 1
fi

exit 0