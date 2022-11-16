#!/bin/bash

res=$(/root/osv-apps/openjdk8-zulu-full/install/usr/lib/jvm/java/jre/bin/java Test)

if [[ $res =~ "test" ]]; then
    exit 0
fi

exit 1