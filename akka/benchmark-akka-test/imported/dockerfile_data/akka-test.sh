#!/bin/bash

sleep 4

echo -ne "dir:/" | netcat -C  localhost 1055 > /root/dirlist & sleep 2 && echo "bye" netcat -C  localhost 1055
if [ "$?" -ne "0" ]; then
    exit 1
fi
dirlist_size=$(cat /root/dirlist | wc -l)
if [ "$dirlist_size" -lt "10" ]; then
    exit 1
fi

echo -ne "file:/root/.bashrc" | netcat -C  localhost 1055 & sleep 2 && echo "bye" netcat -C  localhost 1055
if [ "$?" -ne "0" ]; then
    exit 1
fi
filecontent_size=$(cat /root/dirlist | wc -l)
if [ "$filecontent_size" -lt "10" ]; then
    exit 1
fi

exit 0