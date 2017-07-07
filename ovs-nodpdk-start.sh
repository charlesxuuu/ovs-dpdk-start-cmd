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
ovs-vsctl --may-exist  add-port ovsbr0 enp5s0f0
ovs-vsctl --may-exist  add-br ovsbr1
ovs-vsctl set bridge ovsbr1 stp_enable=true
ovs-vsctl --may-exist  add-port ovsbr1 enp5s0f1

ifconfig ovsbr0 up
ifconfig ovsbr1 up

ifconfig enp5s0f0 up
ifconfig enp2s0f0 up
ifconfig ovsbr0 192.168.100.2
ifconfig ovsbr1 192.168.101.2

