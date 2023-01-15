#!/bin/bash

wrk http://localhost:3000 -d 2
exit $?