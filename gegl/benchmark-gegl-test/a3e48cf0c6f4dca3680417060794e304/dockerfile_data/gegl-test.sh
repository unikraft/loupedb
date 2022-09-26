#!/bin/bash

size=$(ls -s /root/out.png | cut -f 1 -d " ")

if [ "$size" -gt "0" ]; then
    rm -rf /root/out.png &> /dev/null
    exit 0
fi

rm -rf /root/out.png &> /dev/null
exit 1