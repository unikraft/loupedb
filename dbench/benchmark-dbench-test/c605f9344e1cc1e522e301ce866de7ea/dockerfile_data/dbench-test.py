#!/usr/bin/python3

import sys, re

operations = ["NTCreateX", "Close",
                "Qpathinfo", "Find",
                "WriteX", "ReadX",]


output = ""
with open(sys.argv[1]) as f:
    output = f.read()

for op in operations:
    r = re.compile(op + "\s+[0-9]+\s+[0-9]+\.[0-9]+\s+([0-9]+\.[0-9]+)")
    res = r.search(output)
    if not res:
        sys.exit(1)
    maxlat = res.groups()[0]
    if not float(maxlat) > 0:
        sys.exit(1)

sys.exit(0)