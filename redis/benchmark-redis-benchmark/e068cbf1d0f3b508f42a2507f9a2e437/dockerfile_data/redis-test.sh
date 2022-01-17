#!/bin/bash

test_works() {
  nl=$(redis-benchmark -h localhost -n 100 -c 30 -q -t ping_inline,ping,set,get,incr,lpush,rpush,lpop,rpop,sadd,hset,spop,lpush,lrange_100,lrange_300,lrange_500,lrange_600,mset| grep -P "requests per second" | wc -l)

  if [ "$nl" -eq "18" ]; then
      exit 0
  fi
  exit 1
}

benchmark() {
  taskset -c 6 redis-benchmark -h localhost -n 100000 -c 30 -P 16 -q -t set --csv | \
	  cut -d ',' -f2 | tr -d '"'
}

if [ "$2" == "benchmark" ]; then
  benchmark
else
  test_works
fi
