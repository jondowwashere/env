#!/usr/bin/env python

# PACKAGES:
# slapd
# ldap-utils

import os
command = 'apt-get update'
os.system(command)
command = 'apt-get install -y slapd ldap-utils'
os.system(command)
