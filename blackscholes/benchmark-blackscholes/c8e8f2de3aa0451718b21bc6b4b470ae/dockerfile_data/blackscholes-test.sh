#!/bin/bash

bench=$1

nl=$(cat $bench | grep "Num Errors: 0" | wc -l)
if [ "$nl" -eq "1" ]; then
    exit 0
fi

exit 1