#!/bin/bash
# require root priviledge

export PATH=$PATH:/usr/local/share/openvswitch/scripts
export DB_SOCK=/usr/local/var/run/openvswitch/db.sock


ovs-ctl --db-sock="$DB_SOCK" start

# set ovs configurations
ovs-vsctl --no-wait set Open_vSwitch . other_config:dpdk-init=true

# multiple pmd threads pinned to CPU cores
# run on core 0 and core 2 --- 0x101
ovs-vsctl set Open_vSwitch . other_config:pmd-cpu-mask=0x40004
# allocate 4096M on NUMA node 0, 0M on NUMA node 1
ovs-vsctl set Open_vSwitch . other_config:dpdk-socket-mem="4096,4096"
#
ovs-vsctl set Open_vSwitch . other_config:dpdk-lcore-mask=0x100010


ovs-vsctl --may-exist add-br ovsbr0 -- set bridge ovsbr0 datapath_type=netdev
ovs-vsctl --may-exist add-br ovsbr1 -- set bridge ovsbr1 datapath_type=netdev
ovs-vsctl del-port ovsbr0 enp5s0f0
ovs-vsctl add-port ovsbr0 enp5s0f0 -- set Interface enp5s0f0 type=dpdk options:dpdk-devargs=0000:05:00.0
ovs-vsctl del-port ovsbr1 enp5s0f1
ovs-vsctl add-port ovsbr1 enp5s0f1 -- set Interface enp5s0f1 type=dpdk options:dpdk-devargs=0000:05:00.1

ovs-vsctl show
