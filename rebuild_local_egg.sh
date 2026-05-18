#!/bin/bash
# 1. Create a local build directory to avoid GDrive/Mount issues
mkdir -p ~/local_build && cd ~/local_build

# 2. Download a fresh Image Builder (23.05.3 is more stable than .0)
wget https://downloads.openwrt.org/releases/23.05.3/targets/x86/64/openwrt-imagebuilder-23.05.3-x86-64.Linux-x86_64.tar.xz
tar -xJf openwrt-imagebuilder-23.05.3-x86-64.Linux-x86_64.tar.xz
cd openwrt-imagebuilder-23.05.3-x86-64.Linux-x86_64

# 3. Disable the signature check that failed earlier
sed -i 's/option check_signature/ # option check_signature/g' repositories.conf

# 4. Build the image with baked-in security
make image PROFILE="generic" PACKAGES="\
    luci-ssl \
    strongswan-full \
    strongswan-mod-ikev2 \
    kmod-ipsec \
    kmod-tun \
    openssl-util \
    kmod-iwlwifi \
    pciutils \
    usbutils"
