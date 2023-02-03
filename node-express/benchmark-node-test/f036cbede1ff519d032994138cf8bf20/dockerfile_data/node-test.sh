#!/bin/bash

sleep 2

wrk http://localhost:3000 -d 2
exit $?