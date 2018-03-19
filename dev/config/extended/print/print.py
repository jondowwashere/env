#!/usr/bin/env python

# PACKAGES:
# cups
# cups-client
# cups-pdf

import os
command = 'apt-get update'
os.system(command)
command = 'apt-get install -y cups cups-client cups-pdf'
os.system(command)
