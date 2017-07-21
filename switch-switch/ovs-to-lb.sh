#!/bin/bash

# get ports and cache
#sudo ovs-vsctl show |grep 'ovsbr0\|ovsbr1'
#sudo brctl show |grep 'lbbr0\|lbbr1'
sudo brctl addbr lbbr0
sudo brctl addbr lbbr1

sudo ovs-vsctl list-ports ovsbr0 > ports-on-ovsbr0
sudo ovs-vsctl list-ports ovsbr1 > ports-on-ovsbr1

filename="ports-on-ovsbr0"

while read -r line
do
	portname="$line"
	ovs-vsctl del-port $portname
	brctl addif lbbr0 $portname
	ifconfig $portname up
done < "$filename"

filename="ports-on-ovsbr1"

while read -r line
do
        portname="$line"
        ovs-vsctl del-port $portname
        brctl addif lbbr1 $portname
	ifconfig $portname up
done < "$filename"

ifconfig ovsbr0 0.0.0.0
ifconfig ovsbr1 0.0.0.0
ifconfig lbbr0 192.168.100.102
ifconfig lbbr1 192.168.101.102
ifconfig lbbr0 up
ifconfig lbbr1 up

sudo bash ../set-eth-speed.sh
