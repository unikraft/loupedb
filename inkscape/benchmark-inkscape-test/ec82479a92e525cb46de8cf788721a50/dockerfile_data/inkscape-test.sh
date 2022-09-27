#!/bin/bash

size=$(ls -s /root/output.png | cut -f 1 -d " ")

if [ "$size" -gt "0" ]; then
    rm -rf /root/output.png &> /dev/null
    exit 0
fi

rm -rf /root/output.png &> /dev/null
exit 1