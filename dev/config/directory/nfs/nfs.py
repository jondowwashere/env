#!/usr/bin/env python

# PACKAGES:
# nfs-common
# nfs-kernel-server

import os
command = 'apt-get update'
os.system(command)
command = 'apt-get install -y nfs-common nfs-kernel-server'
os.system(command)
