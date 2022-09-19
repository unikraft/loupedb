#!/bin/bash

bench=$1

dps=$(cat $bench | sed -rn "s/^C Converted Double Precision Whetstones:\s+([0-9]+)\.[0-9]+\s+MIPS$/\1/p")
if [ $dps -gt 1000 ]; then
    exit 0
fi

exit 1