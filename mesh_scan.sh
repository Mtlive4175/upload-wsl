#!/bin/bash
# Scan $OF for Sovereign/Hydra signatures
TARGET="/mnt/z/m2n2/ESRI/Data/\$OF"
LOG="mesh_recovery_log.txt"

echo "Starting surgical scan of $TARGET..."

# Search for WebSocket bridges, GIS anchors, and P2P logic
sudo grep -arE "Sovereign|Hydra|WebSocket|KML|venom-spray|DHT" "$TARGET" 2>/dev/null | tee "$LOG"

# Specifically look for your Node.js require patterns
sudo grep -ar "require('ws')" "$TARGET" >> "$LOG"
