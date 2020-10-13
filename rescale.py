#!/usr/bin/env python3
import sys
import re

print("* rescaled with ./rescale.py")

def convert(match):
    dim = int(match.group(2))
    return "%s=%.2f" % (match.group(1), dim * scale * 1e-6)

with open(sys.argv[1]) as fh:
    for line in fh.readlines():
        m = re.search("^.option scale=(\d+)u", line)
        if m:
            scale = int(m.group(1))
            continue

        print(re.sub('([wl])=(\d+)', convert, line.strip()))
