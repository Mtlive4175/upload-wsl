#!/bin/bash
echo "[!] INITIATING NETWORK TAKEOVER..."

# 1. Elevate Zygote to Primary Gateway
GATEWAY="10.0.8.200"
sudo ip route del default
sudo ip route add default via $GATEWAY

# 2. Bind Workers & Tesla Portals
# This uses your 'drone_bind_logic.js' to force worker accounts through the proxy
node ~/drone_bind_logic.js --gateway $GATEWAY --account-sync

# 3. Final Patch & Secure
sudo apt-get update && sudo apt-get upgrade -y
echo "[+] Integration Complete. Network is now Sovereign."
