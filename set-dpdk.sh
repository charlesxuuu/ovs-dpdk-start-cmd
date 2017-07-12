#!/bin/bash

echo '[INFO]: should run as root'
export DPDK_DIR=/home/chix/dpdk/dpdk-stable-16.11.2
export DPDK_TARGET=x86_64-native-linuxapp-gcc
export DPDK_BUILD=$DPDK_DIR/$DPDK_TARGET

mkdir -p /mnt/huge

sysctl -w vm.nr_hugepages=4096
mount -t hugetlbfs hugetlbfs /mnt/huge

modprobe vfio-pci
#modprobe igb_uio
modprobe uio_pci_generic
chmod a+x /dev/vfio
chmod 0666 /dev/vfio/*


$DPDK_DIR/tools/dpdk-devbind.py --bind=vfio-pci enp5s0f0
$DPDK_DIR/tools/dpdk-devbind.py --bind=vfio-pci enp5s0f1
#$DPDK_DIR/tools/dpdk-devbind.py --bind=uio_pci_generic enp5s0f0
#$DPDK_DIR/tools/dpdk-devbind.py --bind=uio_pci_generic enp5s0f1


$DPDK_DIR/tools/dpdk-devbind.py --status
