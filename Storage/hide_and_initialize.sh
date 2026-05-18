#!/bin/bash
# 1. Move files out of public view (image_b740b7.png)
sudo mkdir -p /var/lib/system_data
sudo mv /var/www/html/Apps.vhdx /var/lib/system_data/sys_vol_01.vhdx
sudo mv /var/www/html/WebLabs.vhdx /var/lib/system_data/sys_vol_02.vhdx

# 2. Start the Daemons manually (for WSL/non-systemd)
sudo tgtd
sudo iscsid

# 3. Create generic-named iSCSI targets to hide the connection
# Using 'ms-storage' naming to blend in with Windows/Network traffic
sudo tgtadm --lld iscsi --op new --mode target --tid 1 -T iqn.2026-05.com.microsoft:sys-bkup-01
sudo tgtadm --lld iscsi --op new --mode logicalunit --tid 1 --lun 1 -b /var/lib/system_data/sys_vol_01.vhdx

sudo tgtadm --lld iscsi --op new --mode target --tid 2 -T iqn.2026-05.com.microsoft:sys-data-02
sudo tgtadm --lld iscsi --op new --mode logicalunit --tid 2 --lun 1 -b /var/lib/system_data/sys_vol_02.vhdx

# Bind only to the local interface to hide it from the external network
sudo tgtadm --lld iscsi --op bind --mode target --tid 1 -I 127.0.0.1
sudo tgtadm --lld iscsi --op bind --mode target --tid 2 -I 127.0.0.1

echo "Volumes moved and renamed. Connection hidden behind local loopback."
