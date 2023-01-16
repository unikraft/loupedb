#!/bin/bash

nl=$(cat $1 | grep -P "Google" | wc -l)
if [ "$nl" -eq "1" ]; then
    exit 0
fi

exit 1