#!/bin/bash

sleep 2

output=$(/root/osv-apps/iperf/iperf-2.0.5/src/iperf)
error=$(echo $output | grep "ERROR" | wc -l)

if [ "$error" -gt "0" ]; then
    exit 1
fi

exit 0