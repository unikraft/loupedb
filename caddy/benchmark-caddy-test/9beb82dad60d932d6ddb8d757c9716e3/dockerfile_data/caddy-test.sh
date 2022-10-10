#!/bin/bash

output=$(wrk http://localhost:2015)
exit $?