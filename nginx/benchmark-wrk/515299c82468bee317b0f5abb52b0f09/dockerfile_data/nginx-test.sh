#!/bin/bash

# nginx command: ./objs/nginx -p $(pwd) -g 'daemon off;'

WRK_PATH=/root/hle/pub/wrk/wrk
PORT=8034

test_works() {
  bench=$(${WRK_PATH} http://localhost:${PORT}/index.html -d3s)

  failure=$(echo ${bench} | grep -P "unable to connect to localhost" | wc -l)
  if [ "$failure" -eq "1" ]; then
      exit 200
  fi

  nl=$(echo ${bench} | grep -P "Transfer/sec:\s*\d+(?:\.\d+)MB" | wc -l)
  if [ "$nl" -eq "1" ]; then
      exit 0
  fi

  exit 1
}

benchmark() {
  taskset -c 6 ${WRK_PATH} http://localhost:${PORT}/index.html -d10s | \
	  grep -P "Requests/sec:\s*\d+(?:\.\d+)" | grep -Po "\d+(?:\.\d+)"
  exit $?
}

if [ "$2" == "benchmark" ]; then
  benchmark
else
  test_works
fi
