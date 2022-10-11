#!/bin/bash

sleep 1

output=$(wrk -d5s http://localhost:10000)
exit $?