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
ovs-vsctl del-port ovsbr0 enp5s0f0
ifconfig enp5s0f0 up
ovs-vsctl add-port ovsbr0 enp5s0f0


ovs-vsctl --may-exist  add-br ovsbr1
ovs-vsctl set bridge ovsbr1 stp_enable=true
ovs-vsctl del-port ovsbr1 enp5s0f1
ifconfig enp5s0f1 up
ovs-vsctl add-port ovsbr1 enp5s0f1

ifconfig ovsbr0 up
ifconfig ovsbr1 up

sudo bash ./ovsbr-ip.sh


sudo ethtool -K enp5s0f0 tso off
sudo ethtool -K enp5s0f0 gso off
sudo ethtool -K enp5s0f0 gro off

sudo ethtool -K enp5s0f1 tso off
sudo ethtool -K enp5s0f1 gso off
sudo ethtool -K enp5s0f1 gro off
