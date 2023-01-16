#!/bin/bash

sleep 1

wrk http://localhost:8000 -d 2
exit $?