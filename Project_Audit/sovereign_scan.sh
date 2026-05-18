#!/bin/bash
# Sovereign Asset Discovery & Service Scan
TARGET_RANGE="10.0.8.0/24"
INT="eth0"
SOURCE_IP="10.0.8.201"

echo "[!] Initiating Target Scan from $SOURCE_IP..."

# 1. ARP Scan (Find all 'Workers' on the local wire instantly)
# This is silent to the OS and bypasses many firewalls
sudo arp-scan --interface=$INT --srcaddr=$SOURCE_IP $TARGET_RANGE | tee ~/scan_results_arp.txt

# 2. Forensic Service Scan (Check for Portals & Tesla Bridges)
# Targets common ports in your files: 80 (OpenWrt), 3000 (Node.js), 8080 (Tesla Widget)
echo "[+] Analyzing Active Portals..."
nmap -sS -Pn -T4 --source-ip $SOURCE_IP -p 80,443,3000,8080,8888 $TARGET_RANGE -oG - | grep "open" | tee ~/scan_results_services.txt

# 3. Account Strategy Identification
# Cross-references found IPs with your existing 'drone_bind_logic.js'
echo "[+] Cross-referencing Workers..."
grep -r "IP" ~/workers | cut -d':' -f2 | sort -u > ~/known_workers.txt

echo "[!] Scan Complete. Results saved to ~/scan_results_services.txt"
