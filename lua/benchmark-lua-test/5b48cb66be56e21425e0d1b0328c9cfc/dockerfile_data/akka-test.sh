#!/bin/bash

sleep 2

output=$(/root/osv-apps/akka-example/)
error=$(echo $output | grep "ERROR" | wc -l)

if [ "$error" -gt "0" ]; then
    exit 1
fi

exit 0