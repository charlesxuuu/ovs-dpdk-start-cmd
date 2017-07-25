#!/bin/bash

# get ports and cache
#sudo ovs-vsctl show |grep 'ovsbr0\|ovsbr1'
#sudo brctl show |grep 'lbbr0\|lbbr1'
#tap up

filename="ports-on-ovsbr0"

while read -r line
do
	ifconfig $portname up
done < "$filename"

filename="ports-on-ovsbr1"

while read -r line
do
	ifconfig $portname up
done < "$filename"


