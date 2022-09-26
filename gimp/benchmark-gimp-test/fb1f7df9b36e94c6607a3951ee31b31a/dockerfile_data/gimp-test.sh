#!/bin/bash

size=$(ls -s /root/DSC_6782.png| cut -f 1 -d " ")

if [ "$size" -lt "10000" ]; then
    rm -rf /root/DSC_6782.png &> /dev/null
    tar xf /root/photos.tar.bz2
    exit 0
fi

rm -rf /root/DSC_6782.png &> /dev/null
tar xf /root/photos.tar.bz2
exit 1