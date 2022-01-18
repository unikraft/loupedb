#!/bin/bash

#/usr/sbin/lighttpd -D -f lighttpd.conf

nl=$(wrk http://127.0.0.1:8080/ -d3s | grep -P "Transfer/sec:\s*\d+(?:\.\d+)MB" | wc -l)

if [ "$nl" -eq "1" ]; then
    exit 0
fi
exit 1
