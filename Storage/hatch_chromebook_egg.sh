#!/bin/bash

# 1. Locate the OpenWrt Image Builder
BUILDER_PATH=$(find ~ -name "openwrt-imagebuilder-*" -type d -print -quit)

if [ -z "$BUILDER_PATH" ]; then
    echo "Builder not found. Checking Project_IoT_Eggs..."
    BUILDER_PATH=$(find ~/Project_IoT_Eggs -name "openwrt-imagebuilder-*" -type d -print -quit)
fi

if [ -z "$BUILDER_PATH" ]; then
    echo "Error: OpenWrt Image Builder directory not found."
    exit 1
fi

cd "$BUILDER_PATH"

# 2. Build the image with SSL and IKE/StrongSwan
# Including kmod-iwlwifi for the Chromebook's internal card
make image PROFILE="generic" PACKAGES="\
    luci-ssl \
    strongswan-full \
    strongswan-mod-ikev1 \
    strongswan-mod-ikev2 \
    kmod-ipsec \
    kmod-tun \
    openssl-util \
    kmod-iwlwifi \
    pciutils \
    usbutils"

echo "------------------------------------------------"
echo "Build complete. Check the bin/targets/x86/64/ directory."
