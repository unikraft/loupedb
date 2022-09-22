#!/usr/bin/python3

import sys, re

output = ""

with open(sys.argv[1]) as f:
    output = f.read()

aes_re = re.compile("aes-cbc\s+(128b|256b|512b)\s+([0-9]+\.[0-9]+)\s+MiB\/s\s+([0-9]+\.[0-9]+)\s+MiB/s")
serpent_re = re.compile("serpent-cbc\s+(128b|256b|512b)\s+([0-9]+\.[0-9]+)\s+MiB\/s\s+([0-9]+\.[0-9]+)\s+MiB/s")
twofish_re = re.compile("twofish-cbc\s+(128b|256b|512b)\s+([0-9]+\.[0-9]+)\s+MiB\/s\s+([0-9]+\.[0-9]+)\s+MiB/s")


a = aes_re.search(output)
if a and float(a.groups()[1]) > 0 and float(a.groups()[2]) > 0:
    s = serpent_re.search(output)
    if s and float(s.groups()[1]) > 0 and float(s.groups()[2]) > 0:
        t = twofish_re.search(output)
        if t and float(t.groups()[1]) > 0 and float(t.groups()[2]) > 0:
            sys.exit(0)

sys.exit(1)