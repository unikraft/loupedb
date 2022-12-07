#!/bin/bash

out=$1
res=$(grep -c -i "Uperf Version" $out)

if [ $res -eq "1" ]; then
    exit 0
fi

exit 1