#!/bin/bash

sleep 2

output=$(/root/osv-apps/apache-kafka/ROOTFS/kafka/bin/zookeeper-shell.sh  localhost stat / 2>&1)
ret=$?
nl=$(echo $output | grep -P "numChildren = [0-9]+" | wc -l)

if [ "$ret" -eq "0" ]; then
    if [ "$nl" -eq "1" ]; then
        exit 0
    fi
fi

exit 1