#!/bin/bash

sleep 60

wrk http://localhost:25565 -d 2
exit $?