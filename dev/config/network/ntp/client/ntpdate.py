#!/usr/bin/env python

# PACKAGES:
# ntpdate

import os
command = 'apt-get update'
os.system(command)
command = 'apt-get install -y ntpdate'
os.system(command)
