#!/usr/bin/env python

# PACKAGES:
# puppet

import os

command = 'apt-get update'
os.system(command)
command = 'apt-get install puppet'
os.system(command)
