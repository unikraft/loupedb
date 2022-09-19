#!/bin/bash

bench=$1

nl=$(cat $bench | grep -P "^\s*Verification\s+=\s+SUCCESSFUL$" | wc -l)
if [ $nl -eq 1 ]; then
    exit 0
fi

exit 1