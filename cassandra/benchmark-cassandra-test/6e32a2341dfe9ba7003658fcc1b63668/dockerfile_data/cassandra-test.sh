#!/bin/bash

sleep 10

output=$(/root/osv-apps/cassandra/upstream/apache-cassandra-2.1.0/tools/bin/cassandra-stress write n=1000 -rate threads=1)
exit $?