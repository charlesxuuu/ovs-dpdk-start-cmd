#!/bin/bash

# get ports and cache
#sudo ovs-vsctl show |grep 'ovsbr0\|ovsbr1'
#sudo brctl show |grep 'lbbr0\|lbbr1'
#sudo brctl addbr lbbr0
#sudo brctl addbr lbbr1

#sudo ovs-vsctl list-ports ovsbr0 > ports-on-ovsbr0
#sudo ovs-vsctl list-ports ovsbr1 > ports-on-ovsbr1

filename="ports-on-ovsbr0"

while read -r line
do
	portname="$line"
	brctl delif lbbr0 $portname
	ovs-vsctl add-port ovsbr0 $portname
	ifconfig $portname up
done < "$filename"

filename="ports-on-ovsbr1"

while read -r line
do
        portname="$line"
        brctl delif lbbr1 $portname
        ovs-vsctl add-port ovsbr1 $portname
	ifconfig $portname up
done < "$filename"

ifconfig lbbr0 0.0.0.0
ifconfig lbbr1 0.0.0.0
ifconfig ovsbr0 192.168.100.102
ifconfig ovsbr1 192.168.101.102
ifconfig ovsbr0 up
ifconfig ovsbr1 up
#bash ../set-eth-speed.sh
