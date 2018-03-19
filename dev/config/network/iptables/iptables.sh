# /etc/iptables/iptables.sh

#!/usr/bin/env bash

# definitions
EXTERNAL_INT="eth0"
INTERNAL_INT="eth1"
EXTERNAL_IP=`wget http://ipecho.net/plain -O - -q ; echo`
INTERNAL_IP='1.1.1.1'

# flush rules
iptables -F
iptables -F -t nat
iptables -F -t mangle

# Counters to zero 
iptables -Z

# loopback
iptables -A INPUT -i lo -j ACCEPT

# dns 
iptables -A OUTPUT -p udp -o $EXTERNAL_INT --dport 53 --sport 1024:65535 -j ACCEPT
iptables -A INPUT  -p udp -i $EXTERNAL_INT --sport 53 --dport 1024:65535 -j ACCEPT

# ping
iptables -A OUTPUT  -p icmp --icmp-type 8 -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT   -p icmp --icmp-type 8 -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -p icmp --icmp-type 8 -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT

# ssh
iptables -A OUTPUT  -o $EXTERNAL_INT -p tcp --sport 22 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A INPUT   -i $EXTERNAL_INT -p tcp --dport 22 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT  -o $EXTERNAL_INT -p tcp --dport 22 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A INPUT   -i $EXTERNAL_INT -p tcp --sport 22 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A forward -o $EXTERNAL_INT -p tcp --dport 22 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A forward -i $EXTERNAL_INT -p tcp --sport 22 -m state --state NEW,ESTABLISHED -j ACCEPT

# www
iptables -A OUTPUT  -p tcp -i $EXTERNAL_INT --dport 80 --sport 1024:65535 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A INPUT   -p tcp -i $EXTERNAL_INT --dport 80 --sport 1024:65535 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A FORWARD -p tcp -i $EXTERNAL_INT --dport 80 --sport 1024:65535 -m state --state NEW,ESTABLISHED -j ACCEPT

# established connections
iptables -A OUTPUT  -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT   -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

# nat
modprobe ipt_MASQUERADE
echo 1 > /proc/sys/net/ipv4/ip_forward
iptables -t nat -A POSTROUTING     -o eth0                                      -j MASQUERADE
iptables        -A FORWARD -i eth0 -o eth1 -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables        -A FORWARD -i eth1 -o eth0                                      -j ACCEPT

# default policies
iptables           -A OUTPUT      -j ACCEPT
iptables           -A INPUT       -j ACCEPT
iptables           -A FORWARD     -j ACCEPT
iptables -t nat    -A OUTPUT      -j ACCEPT
iptables -t nat    -A PREROUTING  -j ACCEPT
iptables -t nat    -A POSTROUTING -j ACCEPT
iptables -t mangle -A OUTPUT      -j ACCEPT
iptables -t mangle -A INPUT       -j ACCEPT
iptables -t mangle -A FORWARD     -j ACCEPT
iptables -t mangle -A PREROUTING  -j ACCEPT
iptables -t mangle -A POSTROUTING -j ACCEPT
