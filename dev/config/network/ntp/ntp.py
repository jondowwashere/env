#!/usr/bin/env python

# PACKAGES:
# ntp

import os
command = 'apt-get update'
os.system(command)
command = 'apt-get install -y ntp'
os.system(command)
