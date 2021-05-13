#!/bin/bash

if [ "$(whoami)" != "root" ]; then
  sudo "$0" "$@"
  exit $?
fi

mkfs.vfat /dev/lab2p1
mkfs.vfat /dev/lab2p2
mkfs.vfat /dev/lab2p3

mkdir /mnt/disk1
mkdir /mnt/disk2
mkdir /mnt/disk3

mount /dev/lab2p1 /mnt/disk1
mount /dev/lab2p2 /mnt/disk2
mount /dev/lab2p3 /mnt/disk3

function create_files() {
  dd if=/dev/urandom of=/mnt/disk1/file bs=1M count=5
  dd if=/dev/urandom of=/mnt/disk2/file bs=1M count=5
  dd if=/dev/urandom of=/mnt/disk3/file bs=1M count=5
}

function delete_files() {
  rm /mnt/disk1/file
  rm /mnt/disk2/file
  rm /mnt/disk3/file
}

create_files

  echo "Copying files within virtual disk"
  pv /mnt/disk1/file > /mnt/disk3/file
  pv /mnt/disk2/file > /mnt/disk3/file
  pv /mnt/disk3/file > /mnt/disk1/file

delete_files

create_files
  echo "Copying files from virtual file to real disk"
  mkdir /tmp/io
  pv /mnt/disk1/file > /tmp/io/testfile
  pv /mnt/disk2/file > /tmp/io/testfile
  pv /mnt/disk3/file > /tmp/io/testfile
delete_files

umount /dev/lab2p1
umount /dev/lab2p2
umount /dev/lab2p3
