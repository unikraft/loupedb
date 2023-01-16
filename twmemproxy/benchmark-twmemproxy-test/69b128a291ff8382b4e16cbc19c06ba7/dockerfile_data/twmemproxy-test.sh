#!/bin/bash

sleep 2

wrk http://localhost:22222 -d 2
exit $?