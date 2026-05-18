#!/bin/bash
mkdir -p ~/tesla_tools && cd ~/tesla_tools

# Pulling the core logic repos
git clone https://github.com/AVLN75/android-external-tesla-android-usb-networking-initialiser
git clone https://github.com/AVLN75/tesla-can-explorer
git clone https://github.com/AVLN75/TeslaPy

echo "Tools staged. Ready for cross-compilation into OpenWrt."
