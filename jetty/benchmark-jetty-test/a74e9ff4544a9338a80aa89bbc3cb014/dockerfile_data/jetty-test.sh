#!/bin/bash

sleep 1

wrk http://localhost:8080 -d 2
exit $?