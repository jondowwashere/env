#!/usr/bin/env python

# PACKAGES:
# nfs-common
# nfs-client

import os
command = 'apt-get update'
os.system(command)
command = 'apt-get install -y nfs-common nfs-client'
os.system(command)
