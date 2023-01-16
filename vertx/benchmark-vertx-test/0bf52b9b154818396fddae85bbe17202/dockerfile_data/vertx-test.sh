#!/bin/bash

sleep 3

wrk http://localhost:8080 -d 2
exit $?