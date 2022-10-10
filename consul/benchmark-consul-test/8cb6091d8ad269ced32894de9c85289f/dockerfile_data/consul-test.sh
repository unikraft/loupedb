#!/bin/bash

export CONSUL_HTTP_TOKEN=`cat /root/consul-token-bootstrap.json | jq -r ".SecretID"`

sleep 5

output=$(/root/bin/consul members)
ret=$?

nl=`echo $output | grep alive | wc -l`

if [ "$ret" -eq "0" ]; then
    if [ "$nl" -ge "1" ]; then
        exit 0
    fi
fi

exit 1