#!/bin/bash

sleep 2

sysbench /usr/share/sysbench/oltp_read_write.lua --mysql-user=test --mysql-password=test --mysql-db=test cleanup
sysbench /usr/share/sysbench/oltp_read_write.lua --mysql-user=test --mysql-password=test --mysql-db=test prepare

bench=$(sysbench /usr/share/sysbench/oltp_read_write.lua --mysql-user=test --mysql-password=test --mysql-db=test run)

events=$(echo ${bench} | sed -rn "s/.*total number of events:\s+([0-9]+).*/\1/p")
if [ "$events" -gt "0" ]; then
    exit 0
fi

exit 1