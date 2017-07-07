#!/bin/bash
#Reference: http://docs.openvswitch.org/en/latest/intro/install/general/#configuring 
#Require root privilege 

#Setting path
export PATH=$PATH:/usr/local/share/openvswitch/scripts

ovs-ctl start
ovs-vsctl del-br ovsbr0
ovs-vsctl --may-exist  add-br ovsbr0
ovs-vsctl set bridge ovsbr0 stp_enable=true
ovs-vsctl --may-exist  add-port ovsbr0 eth0
ovs-vsctl --may-exist  add-port ovsbr0 enp2s0

ifconfig ovsbr0 up
ifconfig eth0 up
ifconfig enp2s0 up
ifconfig ovsbr0 192.168.0.2

