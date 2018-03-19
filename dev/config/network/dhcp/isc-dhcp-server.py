#!/usr/bin/env python

# PACKAGES:
# isc-dhcp-server

import os
command = 'apt-get update'
os.system(command)
command = 'apt-get install -y isc-dhcp-server'
os.system(command)
