#!/usr/bin/env python

# PACKAGES:
# postfix
# postfix-ldap
# dovecot-imapd
# dovecot-pop3d
# dovecot-common

import os
command = 'apt-get update'
os.system(command)
command = 'apt-get install -y postfix postfix-ldap dovecot-imapd dovecot-pop3d dovecot-common'
os.system(command)
