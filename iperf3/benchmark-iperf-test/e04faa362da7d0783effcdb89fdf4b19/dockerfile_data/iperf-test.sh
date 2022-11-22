#!/bin/bash

sleep 1

output=$1
ok=$(grep -c -i "iperf 3" $output)

if [ "$ok" -eq "0" ]; then
    exit 1
fi

exit 0