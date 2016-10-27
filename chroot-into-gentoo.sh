#!/bin/bash
# Script to set up for a chroot, then chroot into the Gentoo installation.
sudo mount /mnt/gentoo
sudo mount /mnt/gentoo-boot
sudo mount --rbind /mnt/gentoo-boot /mnt/gentoo/boot
sudo mount -t proc proc /mnt/gentoo/proc
sudo mount --rbind /sys /mnt/gentoo/sys
sudo mount --make-rslave /mnt/gentoo/sys
sudo mount --rbind /dev /mnt/gentoo/dev
sudo mount --make-rslave /mnt/gentoo/dev

if [ -h /dev/shm ]
  then
    echo "About to trash /dev/shm; programs may crash. Hit ENTER when ready."
    read keystroke
    sudo mv /dev/shm /dev/shm.old
    sudo mkdir /dev/shm
    sudo mount -t tmpfs -o nosuid,nodev,noexec shm /dev/shm
    sudo chmod 1777 /dev/shm
  else
    sudo mount -t tmpfs -o nosuid,nodev,noexec shm /dev/shm
fi

chroot /mnt/gentoo /bin/bash

sudo umount /mnt/gentoo/dev
sudo umount /mnt/gentoo/sys
sudo umount /mnt/gentoo/proc

if [ -d /dev/shm ]
  then
    echo "About to trash /dev/shm; programs may crash. Hit ENTER when ready."
    read keystroke
    sudo umount /dev/shm
    sudo rm -R /dev/shm
    sudo mv /dev/shm.old /dev/shm
fi