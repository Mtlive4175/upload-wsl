#!/bin/bash
# 1. Update and install bare minimums
sudo apt update
sudo apt install -y openjdk-17-jre-headless wget

# 2. Create the Vault structure if it doesn't exist
mkdir -p ~/osi_vault/layer7_app/tesla_source
mkdir -p ~/bin

# 3. Download the latest Apktool
if [ ! -f ~/bin/apktool.jar ]; then
    echo "[*] Downloading Apktool..."
    wget https://github.com/iBotPeaches/Apktool/releases/download/v2.10.0/apktool_2.10.0.jar -O ~/bin/apktool.jar
fi

# 4. Grab the Tesla APK (Assuming you need to pull it)
# If you already have it, move it to ~/osi_vault/layer7_app/tesla.apk
echo "[+] Environment Ready. Move your tesla.apk to ~/osi_vault/layer7_app/ before decompiling."
