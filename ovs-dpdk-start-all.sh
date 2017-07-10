#!/bin/bash
#start all

sudo bash ./set-dpdk.sh
sleep 1
sudo bash ./ovs-dpdk-start.sh
