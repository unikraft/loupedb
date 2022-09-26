#!/bin/bash

sr=$(cat $1 | grep seq-read | grep "err= 0" | wc -l)
if [ "$nl" -ne "1" ]; then
    exit 1
fi

rr=$(cat $1 | grep rand-read | grep "err= 0" | wc -l)
if [ "$nl" -ne "1" ]; then
    exit 1
fi

sw=$(cat $1 | grep seq-write | grep "err= 0" | wc -l)
if [ "$nl" -ne "1" ]; then
    exit 1
fi

rw=$(cat $1 | grep rand-seq-write | grep "err= 0" | wc -l)
if [ "$nl" -ne "1" ]; then
    exit 1
fi


exit 0