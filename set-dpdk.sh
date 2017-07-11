#!/bin/bash

echo '[INFO]: should run as root'
export DPDK_DIR=/home/chix/dpdk/dpdk-stable-16.11.2
export DPDK_TARGET=x86_64-native-linuxapp-gcc
export DPDK_BUILD=$DPDK_DIR/$DPDK_TARGET

mkdir -p /mnt/huge
mkdir -p /mnt/huge_2mb

mount -t hugetlbfs hugetlbfs /mnt/huge
mount -t hugetlbfs none /mnt/huge_2mb -o pagesize=2MB

modprobe vfio-pci
chmod a+x /dev/vfio
chmod 0666 /dev/vfio/*


$DPDK_DIR/tools/dpdk-devbind.py --bind=vfio-pci enp5s0f0
$DPDK_DIR/tools/dpdk-devbind.py --bind=vfio-pci enp5s0f1
$DPDK_DIR/tools/dpdk-devbind.py --status
