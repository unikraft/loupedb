#!/bin/bash

output=$(wrk http://localhost)
exit $?