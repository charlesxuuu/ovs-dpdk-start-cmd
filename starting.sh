#!/bin/bash
#Reference: http://docs.openvswitch.org/en/latest/intro/install/general/#configuring 
#Require root privilege 

#Setting path
export PATH=$PATH:/usr/local/share/openvswitch/scripts


ovs-ctl start

ovs-vsctl del-br ovsbr0
ovs-vsctl del-br ovsbr1


ovs-vsctl --may-exist  add-br ovsbr0
ovs-vsctl set bridge ovsbr0 stp_enable=true
ovs-vsctl --may-exist  add-port ovsbr0 eth0
ovs-vsctl --may-exist  add-br ovsbr1
ovs-vsctl set bridge ovsbr1 stp_enable=true
ovs-vsctl --may-exist  add-port ovsbr1 enp2s0

ifconfig ovsbr0 up
ifconfig ovsbr1 up

ifconfig eth0 up
#populate routing table
#192.168.0.0/24 can be reached through ovsbr0
#ip route add 192.168.0.0/24 dev ovsbr0 table eth0_rt
#sets the default gateway
#ip route add default via 192.168.0.1 dev ovsbr0 table eth0_rt

#let the system know when to use new routing table
#should use eth0_rt table 
#ip rule add from 192.168.0.0/24 table eth0_rt
#ip rule add to 192.168.0.0/24 table eth0_rt

ifconfig enp2s0 up
#populate routing table
#192.168.3.0/24 can be reached through ovsbr1
#ip route add 192.168.3.0/24 dev ovsbr1 table eth1_rt
#sets the default gateway
#ip route add default via 192.168.3.1 dev ovsbr1 table eth1_rt

#let the system know when to use new routing table
#should use eth1_rt table 
#ip rule add from 192.168.3.0/24 table eth1_rt
#ip rule add to 192.168.3.0/24 table eth1_rt

#not use dhcp for ovsbr1
dhclient ovsbr0
ifconfig ovsbr1 192.168.3.2

