#!/bin/bash

bench=$1

nl=$(cat "${bench}" | grep -P "^\s+\d+\s+\d+\.\d+\s+\d+\.\d+\%\s+\d+\.\d+\%\s+\d+\.\d+\%\s+\d+\.\d+$" | wc -l)
if [ "$nl" -eq "5" ]; then
    exit 0
fi

exit 1