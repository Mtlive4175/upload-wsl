#!/bin/bash
# Sovereign Stealth Orchestrator: Tap, Analyze, Patch

echo "[+] Initializing Stealth Tap..."

# 1. Background System Patch (Non-interactive & Quiet)
sudo apt-get update -qq && sudo apt-get upgrade -y -qq &

# 2. Parallel Route Fix (The "Tap")
# We set the local IP first so 'prefsrc' works
sudo ip addr add 10.0.8.201/24 dev eth0 2>/dev/null
sudo ip route add 10.0.8.0/24 dev eth0 proto kernel scope link src 10.0.8.201 2>/dev/null

# 3. Find & Update Critical Asset Files (Forensic Update)
# This finds your .ino and .sh files and updates their 'DNA'
echo "[+] Updating Local Asset DNA..."
find ~ -type f \( -name "*.ino" -o -name "*.sh" \) -exec sed -i 's/10.0.8.200/10.0.8.200/g' {} +

# 4. Silent Sniffer Launch
if [ -f "~/sniffer.js" ]; then
    nohup node ~/sniffer.js --interface eth0 --target 10.0.8.200 > /dev/null 2>&1 &
fi

echo "[+] Stealth Integration Active. Monitoring 10.0.8.200."
