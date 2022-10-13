#!/bin/bash

sleep 15

output=$(wrk -d5s http://localhost:80)
exit $?