#!/bin/bash

bench=$1

nl=$(cat $bench | grep -P "^(Copy|Scale|Add|Triad):\s+[0-9]+\.[0-9]+\s+[0-9]+\.[0-9]+\s+[0-9]+\.[0-9]+\s+[0-9]+\.[0-9]+$" | wc -l)
if [ "$nl" -eq "4" ]; then
    errors=$(cat $bench | grep "errors were found" | wc -l)
    if [ "$errors" -eq "0" ]; then
        exit 0
    fi
fi

exit 1