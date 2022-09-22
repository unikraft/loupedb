#!/usr/bin/python3

import sys, re

output = ""

with open(sys.argv[1]) as f:
    output = f.read()

re_write = re.compile("Final score for writes:\s+([0-9]+)")
re_read = re.compile("Final score for reads :\s+([0-9]+)")

w = re_write.search(output)
if w and int(w.groups()[0]) > 0:
    r = re_read.search(output)
    if r and int(r.groups()[0]) > 0:
        sys.exit(0)

sys.exit(1)