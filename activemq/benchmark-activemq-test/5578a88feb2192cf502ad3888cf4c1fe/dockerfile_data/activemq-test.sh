#!/bin/bash

sleep 7

output=$(/root/osv-apps/apache-activemq/ROOTFS/activemq/bin/activemq-admin  list)
ret=$?

if [ "$ret" -eq "0" ]; then
    nl=$(echo $output | grep "brokerName = localhost" | wc -l)
    if [ "$nl" -eq "1" ]; then
        exit 0
    fi
fi

exit 1