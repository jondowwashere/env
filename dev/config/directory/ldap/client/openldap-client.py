#!/usr/bin/env python

# PACKAGES:
# libpam-ldap
# libnss-ldap
# nscd

import os
command = 'apt-get update'
os.system(command)
command = 'apt-get install -y libpam-ldap libnss-ldap nscd'
os.system(command)
