#!/bin/bash

res=$1

if [[ $res != "hello" ]]; then
    exit 0
fi

exit 1