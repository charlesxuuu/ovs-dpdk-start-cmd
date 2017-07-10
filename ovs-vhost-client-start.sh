#!/bin/bash
#add vhost-user-client port to ovs 

export VHOST_USER_SOCKET_PATH=/home/chix/dpdk/socket

ovs-vsctl add-port ovsbr0 vhost-client-1 -- set Interface vhost-client-1 type=dpdkvhostuserclient options:vhost-server-path=$VHOST_USER_SOCKET_PATH/vhost-client-1

ovs-vsctl add-port ovsbr1 vhost-client-2 -- set Interface vhost-client-2 type=dpdkvhostuserclient options:vhost-server-path=$VHOST_USER_SOCKET_PATH/vhost-client-2

