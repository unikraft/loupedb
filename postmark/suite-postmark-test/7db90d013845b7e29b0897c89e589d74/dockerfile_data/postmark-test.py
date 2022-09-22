#!/usr/bin/python3

import sys, re

output = ""

with open(sys.argv[1]) as f:
    output = f.read()

re_write = re.compile("megabytes written \(([0-9]+\.[0-9]+) megabytes per second\)")
re_read = re.compile("megabytes read \(([0-9]+\.[0-9]+) megabytes per second\)")

w = re_write.search(output)
if w and float(w.groups()[0]) > 0:
    r = re_read.search(output)
    if r and float(r.groups()[0]) > 0:
        sys.exit(0)

sys.exit(1)