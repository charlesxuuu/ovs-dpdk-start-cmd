#!/bin/bash
#start all

sudo bash ./set-dpdk.sh
sleep 1
sudo bash ./ovs-dpdk-start.sh
sleep 1
#set ovs-br-ip
#not included in git repo
#example:
#sudo ifconfig ovsbr0 192.168.100.102
#sudo ifconfig ovsbr0 up
#sudo ifconfig ovsbr1 192.168.101.102
#sudo ifconfig ovsbr1 up
sudo bash ./set-ovsbr-ip.sh

