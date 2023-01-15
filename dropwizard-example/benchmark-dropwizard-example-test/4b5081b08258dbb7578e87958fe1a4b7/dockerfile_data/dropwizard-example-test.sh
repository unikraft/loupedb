#!/bin/bash

sleep 5

wrk http://localhost:8080 -d 2
exit $?