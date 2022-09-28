#!/usr/bin/python3

import sys, re

output = ""

with open(sys.argv[1]) as f:
    output = f.read()

r = re.compile("rsa\s+4096\s+bits\s+[0-9]+\.[0-9]+s\s+[0-9]+\.[0-9]+s\s+([0-9]+\.[0-9]+)\s+[0-9]+\.[0-9]+")

search = r.search(output)
if search and float(search.groups()[0]) > 0:
    sys.exit(0)

sys.exit(1)