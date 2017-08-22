#!/bin/bash

echo 'iptables -t nat -N DOCKER' >> /etc/csf/csfpost.sh
echo 'iptables -t nat -A PREROUTING -m addrtype --dst-type LOCAL -j DOCKER' >> /etc/csf/csfpost.sh
echo 'iptables -t nat -A OUTPUT ! -d 127.0.0.0/8 -m addrtype --dst-type LOCAL -j DOCKER' >> /etc/csf/csfpost.sh
echo 'iptables -t nat -A POSTROUTING -s 172.17.0.0/16 ! -o docker0 -j MASQUERADE' >> /etc/csf/csfpost.sh
echo 'iptables -t filter -N DOCKER' >> /etc/csf/csfpost.sh
echo 'iptables -t filter -A FORWARD -o docker0 -j DOCKER' >> /etc/csf/csfpost.sh
echo 'iptables -t filter -A FORWARD -o docker0 -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT' >> /etc/csf/csfpost.sh
echo 'iptables -t filter -A FORWARD -i docker0 ! -o docker0 -j ACCEPT' >> /etc/csf/csfpost.sh
echo 'iptables -t filter -A FORWARD -i docker0 -o docker0 -j ACCEPT' >> /etc/csf/csfpost.sh
service docker restart
csf -r

echo "Done."
