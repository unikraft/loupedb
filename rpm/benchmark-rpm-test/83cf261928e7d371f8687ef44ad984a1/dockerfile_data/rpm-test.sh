#!/bin/bash

out=$1
res=$(grep -c -i "rpm" $out)

if [ $res -eq "0" ]; then
    exit 1
fi

exit 0