#!/usr/bin/env python

# PACKAGES:
# puppetmaster

import os

command = 'apt-get update'
os.system(command)
command = 'apt-get install puppetmaster'
os.system(command)
