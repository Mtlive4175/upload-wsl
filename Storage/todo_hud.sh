#!/bin/bash
# Sovereign TODO & Harvest HUD

echo "=========================================="
echo "   SOVEREIGN TACTICAL HARVEST STATUS      "
echo "=========================================="

# 1. Track Binary Harvesting (The Workstation Patch)
TOOLS=("nmap" "pyaudio" "sniffer.js" "drone_bind")
echo "[BINARIES]"
for tool in "${TOOLS[@]}"; do
    if command -v $tool &> /dev/null || [ -f ~/$tool ]; then
        echo "  [READY] $tool"
    else
        echo "  [MISSING] $tool"
    fi
done

# 2. Track Fleet Assets (The ArcGIS Ingestion)
echo -e "\n[FLEET ASSETS]"
ASSET_COUNT=$(grep -c "IP" ~/known_workers.txt 2>/dev/null || echo "0")
echo "  INGESTED WORKERS: $ASSET_COUNT"
if [ -f ~/tesla_detected_assets.txt ]; then
    echo "  TESLA STATUS: CONNECTED (OOB)"
else
    echo "  TESLA STATUS: SEARCHING..."
fi

# 3. Track Account Strategy (The Takeover)
echo -e "\n[STRATEGY CACHE]"
if [ -s ~/api_audit_tesla.txt ]; then
    echo "  TOKENS HARVESTED: $(wc -l < ~/api_audit_tesla.txt)"
else
    echo "  TOKENS HARVESTED: 0"
fi

echo "=========================================="
