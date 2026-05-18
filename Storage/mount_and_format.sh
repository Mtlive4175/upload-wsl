#!/bin/bash
# 1. Install and start the initiator
sudo apt-get install -y open-iscsi
sudo service open-iscsi start

# 2. Discover and Login (Replace with your Target IP)
TARGET_IP="127.0.0.1" 
sudo iscsiadm -m discovery -t st -p $TARGET_IP
sudo iscsiadm -m node -T iqn.2026-05.it-lab:storage -p $TARGET_IP -l

# 3. Wait for devices to settle, then Format and Mount
# WARNING: This assumes /dev/sdb and /dev/sdc are the new iSCSI disks
echo "Formatting Apps VHDX..."
sudo mkfs.ext4 /dev/sdb
mkdir -p /mnt/it_lab/apps
sudo mount /dev/sdb /mnt/it_lab/apps

echo "Formatting WebApps VHDX..."
sudo mkfs.ext4 /dev/sdc
mkdir -p /mnt/it_lab/web
sudo mount /dev/sdc /mnt/it_lab/web

# 4. Fix permissions for your developer setup
sudo chown -R $USER:$USER /mnt/it_lab
echo "VFS is formatted and side-attached. Start your rebuilds."
