#!/bin/bash
echo "[*] Forcing DNS to 8.8.8.8..."
echo "nameserver 8.8.8.8" | sudo tee /etc/resolv.conf > /dev/null

echo "[*] Syncing hardware clock..."
sudo hwclock -s

echo "[*] Testing connection to GitHub..."
curl -I https://github.com
