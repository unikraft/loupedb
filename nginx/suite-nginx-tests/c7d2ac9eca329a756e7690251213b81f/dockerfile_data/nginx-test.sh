#!/bin/bash

nl=$(cat $1 | grep -P "All tests successful." | wc -l)
if [ "$nl" -eq "1" ]; then
    exit 0
fi

exit 1
