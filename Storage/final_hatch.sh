#!/bin/bash
# Move to the local builder (avoiding GDrive)
cd ~/local_build/openwrt-imagebuilder-23.05.3-x86-64.Linux-x86_64

# Clean the previous failed build
rm -rf build_dir/target-x86_64_musl/root-x86

# Build with corrected package list
# 'strongswan-full' covers IKEv1 and IKEv2. 
# Added 'qrencode' so you can share configs to your phone screen-to-screen.
make image PROFILE="generic" PACKAGES="\
    luci-ssl \
    strongswan-full \
    kmod-ipsec \
    kmod-tun \
    openssl-util \
    kmod-iwlwifi \
    qrencode \
    pciutils \
    usbutils"
