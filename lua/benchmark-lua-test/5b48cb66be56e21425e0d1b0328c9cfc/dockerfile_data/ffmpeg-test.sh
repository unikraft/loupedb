#!/bin/bash

res=$(ffmpeg -formats)

if [[ $res =~ "" ]]; then
    exit 1
fi

exit 0