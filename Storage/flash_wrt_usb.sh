#!/bin/bash
# Master USB Flash Script for WRT_BOOT

TARGET_DIR="/mnt/w"
BUILD_DIR="$HOME/local_build/openwrt-imagebuilder-23.05.3-x86-64.Linux-x86_64/bin/targets/x86/64"

echo "[+] Creating mount point and attaching the W: drive..."
sudo mkdir -p $TARGET_DIR
sudo mount -t drvfs W: $TARGET_DIR 2>/dev/null

if [ ! -d "$TARGET_DIR/EFI" ]; then
    echo "[+] Structuring EFI Boot directories..."
    sudo mkdir -p $TARGET_DIR/EFI/BOOT
fi

echo "[+] Copying Kernel and Root Image to USB..."
sudo cp $BUILD_DIR/openwrt-23.05.3-x86-64-generic-kernel.bin $TARGET_DIR/vmlinuz
sudo cp $BUILD_DIR/openwrt-23.05.3-x86-64-generic-ext4-combined-efi.img.gz $TARGET_DIR/rootfs.img.gz

echo "[+] Injecting the USB-Ethernet Connection Handshake..."
sudo tee $TARGET_DIR/usb_handshake.sh << 'SCRIPT_EOF'
#!/bin/sh
# Auto-configures the USB port to talk directly to your Moto G phone
mkdir -p /sys/kernel/config/usb_gadget/g1
cd /sys/kernel/config/usb_gadget/g1
echo 0x1d6b > idVendor
echo 0x0104 > idProduct
mkdir -p configs/c.1/strings/0x409
echo "Ethernet" > configs/c.1/strings/0x409/configuration
mkdir -p functions/ecm.usb0
ln -s functions/ecm.usb0 configs/c.1/
ls /sys/class/udc > UDC
ifconfig usb0 192.168.7.2 netmask 255.255.255.0 up
SCRIPT_EOF

sudo chmod +x $TARGET_DIR/usb_handshake.sh

echo "[+] Synchronizing data cache..."
sync

echo "[+] Cleaning up and unmounting USB safely..."
sudo umount $TARGET_DIR
echo "=================================================="
echo "[SUCCESS] USB is baked! Ready for the Chromebook."
echo "=================================================="
