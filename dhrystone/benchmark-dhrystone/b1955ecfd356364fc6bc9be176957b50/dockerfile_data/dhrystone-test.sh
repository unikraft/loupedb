#!/bin/bash

bench=$1

dps=$(cat $bench | sed -rn "s/^Dhrystones per Second:\s+([0-9]+)\s*$/\1/p")
if [ $dps -gt 10000 ]; then
    exit 0
fi

exit 1