#!/usr/bin/env python

# PACKAGES:
# bind9
# dnsutils

import os
command = 'apt-get update'
os.system(command)
command = 'apt-get install -y bind9 dnsutils'
os.system(command)
