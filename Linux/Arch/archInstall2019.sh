#!/usr/bash

# TODO: Check if intel or amd > add appropriate stuff

# TODO: Check gpu if 7series or <


HOSTNAME='CtrlPC'

echo "Welcome to Fonz Arch Install"


lsblk

echo "Checking & Partitioning Standard Drive"

echo "Partition"

parted /dev/sda -s \
mklabel gpt \
mkpart ESP fat32 1M 128M \
set 1 boot on \
mkpart primary ext4 128M 100% \

lsblk

echo "Format Disk"

mkfs.vfat -n ESP /dev/sda1
mkfs.btrfs -f -L ROOT /dev/sda2
# echo "Checking & Partitioning Nvme Drive"
