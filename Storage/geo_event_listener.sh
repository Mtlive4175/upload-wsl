#!/bin/bash
# Sovereign Geo-Fence V3 - Persistent & Protective

SAFE_LAT="33.7490"
SAFE_LON="-84.3880"
THRESHOLD="0.01"    # Lockdown Trigger (~1km)
KILL_LIMIT="1.50"   # Data Wipe/Dismount Trigger (~150km)

echo "[+] Sovereign Geo-Listener Active..."

while true; do
    CURRENT_LOC=$(grep "<coordinates>" ~/Sovereign_Live_Feed.kml 2>/dev/null | sed -e 's/<[^>]*>//g' | tr -d ' ')
    
    if [ ! -z "$CURRENT_LOC" ]; then
        LON=$(echo $CURRENT_LOC | cut -d',' -f1)
        LAT=$(echo $CURRENT_LOC | cut -d',' -f2)
        DIFF=$(echo "$LAT - $SAFE_LAT" | bc -l | tr -d '-')

        # EVENT: Extreme Distance (Kill Switch)
        if (( $(echo "$DIFF > $KILL_LIMIT" | bc -l) )); then
            echo "[CRITICAL] EXTREME DISTANCE. DISMOUNTING VAULT."
            powershell.exe -Command "Dismount-VHD -Path 'C:\Users\m2n2\Sovereign_Vault\Assets\Sovereign_Vault_Recovered\Matrix_Core.vhdx'" 2>/dev/null
        
        # EVENT: Untrusted Zone (Lockdown & Patch)
        elif (( $(echo "$DIFF > $THRESHOLD" | bc -l) )); then
            echo "[EVENT] UNTRUSTED ZONE. ROTATING SSL & PATCHING..."
            sudo apt-get update -qq && sudo apt-get upgrade -y -qq
            [ -f ~/tesla_encoded_ssl.conf ] && ~/tesla_encoded_ssl.conf --rotate
        else
            echo "[STATUS] ESRI Node Secure in Safe Zone."
        fi
    fi
    sleep 300
done
