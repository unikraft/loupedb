#!/bin/bash

sleep 5

wrk http://localhost -d 2
exit $?
