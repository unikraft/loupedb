#!/bin/bash

sleep 1
out=$1
res=$(grep -c -i "hello" $out)

if [ $res -eq "0" ]; then
    erl -noshell -s init stop
    exit 1
fi

erl -noshell -s init stop
exit 0