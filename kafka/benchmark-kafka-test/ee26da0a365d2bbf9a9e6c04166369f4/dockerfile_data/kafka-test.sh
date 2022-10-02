#!/bin/bash

sleep 4

output=$(/root/osv-apps/apache-kafka/ROOTFS/kafka/bin/kafka-producer-perf-test.sh --topic test --num-records 50 --throughput 10 --producer-props bootstrap.servers=localhost:9092 key.serializer=org.apache.kafka.common.serialization.StringSerializer value.serializer=org.apache.kafka.common.serialization.StringSerializer --record-size 1)
ret=$?
nl=$(echo $output | grep -P "50 records sent" | wc -l)

if [ "$ret" -eq "0" ]; then
    if [ "$nl" -eq "1" ]; then
        exit 0
    fi
fi

exit 1