#!/bin/bash

# --- 1. MAPPING PROTECTED ASSETS ---
# If standard paths fail, we force-link them to the SC label
echo "[*] Bridging Tesla App Data to SC Label..."
su -c "mkdir -p ~/SC && mount --bind /data/data/com.tesla.tesla ~/SC"

# --- 2. GHOST IPTABLES (Camouflage) ---
# Maps your Repo logic to standard HTTP/HTTPS/DNS ports
su -c "
iptables -t nat -F
iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to-port 8080
iptables -t nat -A PREROUTING -p tcp --dport 443 -j REDIRECT --to-port 8081
iptables -t nat -A PREROUTING -p tcp --dport 53 -j REDIRECT --to-port 79
"

# --- 3. REPO & HEARTBEAT ---
REPO_PATH="$HOME/Sovereign/projects/Tesla-L7-Scanner"
export NODE_PATH="$HOME/node_modules:$REPO_PATH/node_modules"

# Masked DNS Heartbeat (Port 53)
pkill -f "nc -l -p 79"
(while true; do echo "DNS_QUERY_STATUS: NOMINAL"; done | nc -l -p 79) &

# --- 4. STARTING THE EXECUTIVE ---
echo "[*] System SC Energized. Executive live in $REPO_PATH"
cd "$REPO_PATH"
node setup_tesla_node.js
