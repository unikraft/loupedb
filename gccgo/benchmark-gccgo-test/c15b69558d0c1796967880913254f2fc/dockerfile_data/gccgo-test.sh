#!/bin/bash

out=$(./a.out)
res=$(grep -c -i "Hello" $out)

if [ $res -eq "0" ]; then
    exit 1
fi

exit 0