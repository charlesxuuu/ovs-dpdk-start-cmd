#!/bin/bash

export DPDK_DIR=/home/chix/dpdk/dpdk-stable-16.11.2
export DPDK_TARGET=x86_64-native-linuxapp-gcc
export DPDK_BUILD=$DPDK_DIR/$DPDK_TARGET

sudo modprobe vfio-pci
$DPDK_DIR/tools/dpdk-devbind.py --bind=vfio-pci enp5s0f0
$DPDK_DIR/tools/dpdk-devbind.py --status
