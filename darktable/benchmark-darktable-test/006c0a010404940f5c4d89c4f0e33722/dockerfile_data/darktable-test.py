#!/usr/bin/python3

import sys
import shutil
import re

output = 22

with open(sys.argv[1]) as f:
    output = f.read()

r = re.compile("pixel pipeline processing took [0-9]+\.[0-9]+ secs")
if r.search(output):
    shutil.rmtree("/root/.config/darktable")
    exit(0)

try:
    shutil.rmtree("/root/.config/darktable")
except Exception:
    pass

exit(1)
