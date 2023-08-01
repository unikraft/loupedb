#!/bin/bash

sleep 1

h=localhost

test_iperf() {
    # return performance in bits per second
    iperf3 -c $h -t ${1}s -J | tac | grep -m 1 bits_per_second | awk '{print $2}' | grep -o ".*\." | sed 's/.$//'
}

test_works() {
    bps=$(test_iperf 2)

    # if is a number
    if [[ $bps =~ ^-?[0-9]+$ ]]; then
        # if more than zero
        if [ $bps -gt 0 ]; then
            exit 0
        fi
    fi

    exit 1
}

benchmark() {
    # 10s because we want more stable numbers
    bps=$(test_iperf 10)

    if [[ $bps =~ ^-?[0-9]+$ ]]; then
        if [ $bps -gt 0 ]; then
            echo $bps
        fi
    fi

    exit $?
}

if [ "$2" == "benchmark" ]; then
  benchmark
else
  test_works
fi
