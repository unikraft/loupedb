#!/bin/bash

sleep 2

output=$(/root/osv-apps/apache-derby/db-derby-10.14.1.0-bin/bin/ij /root/ij-cmds)
error=$(echo $output | grep "ERROR" | wc -l)

if [ "$error" -gt "0" ]; then
    exit 1
fi

exit 0