
#!/bin/bash
# remove customized kernel version

sudo rm -rf /boot/vmlinuz-$1
sudo rm -rf /boot/initrd.img-$1
sudo rm -rf /boot/System.map-$1
sudo rm -rf /boot/config-$1
sudo rm -rf /lib/modules/$1
sudo update-grub
