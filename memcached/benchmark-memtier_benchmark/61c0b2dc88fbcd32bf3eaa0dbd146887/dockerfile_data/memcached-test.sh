#!/bin/bash

nl=$(memtier_benchmark -P memcache_binary -p 11211 -c 30 --hide-histogram --test-time=1 | grep Totals | awk '{print $2;}')

echo $nl

if [ "$nl" = "0.00" ]; then
    exit 1
fi
exit 0
