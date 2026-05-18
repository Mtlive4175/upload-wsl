#!/bin/bash
# SENTINEL // SCOUT MESH GENESIS (V8) - PERMISSION FIXED

# 1. Setup Vault Directories
VAULT="/mnt/sentinel"
WORKERS="$VAULT/workers"

echo "[*] Ensuring Vault Permissions..."
sudo mkdir -p $WORKERS
sudo chown -R $USER:$USER $VAULT

# 2. Build the 1,000-Contact Phone Book (Excel/CSV)
echo "[*] Building Phone Book..."
cat << 'CSV_HEADER' > $WORKERS/phonebook.csv
Worker_ID,Virtual_MAC,Port,SIP_Extension,Status,Last_Harvest
CSV_HEADER

for i in {1..1000}; do
    ID=$(printf "%03d" $i)
    MAC=$(printf '00:60:2F:%02X:%02X:%02X' $((RANDOM%256)) $((RANDOM%256)) $i)
    PORT=$((10000 + i))
    SIP=$((7000 + i))
    echo "HRV_$ID,$MAC,$PORT,$SIP,IDLE,N/A" >> $WORKERS/phonebook.csv
done

# 3. Create the KML Generator Script (Python)
echo "[*] Deploying KML Logic..."
cat << 'KML' > $WORKERS/kml_gen.py
import simplekml
import pandas as pd
import os
def build_scout_map():
    try:
        df = pd.read_csv('/mnt/sentinel/workers/phonebook.csv')
        kml = simplekml.Kml()
        for index, row in df.iterrows():
            pnt = kml.newpoint(name=row['Worker_ID'])
            pnt.style.iconstyle.color = 'ff00ff00' if "ACTIVE" in str(row['Status']) else 'ff0000ff'
            pnt.description = f"MAC: {row['Virtual_MAC']}\nPort: {row['Port']}\nSIP: {row['SIP_Extension']}"
            pnt.coords = [(-74.0060 + (index * 0.001), 40.7128)]
        kml.save("/mnt/sentinel/workers/active_mesh.kml")
    except Exception:
        pass
if __name__ == "__main__":
    build_scout_map()
KML

# 4. Create the Scout Nanobot Template (Factory)
echo "[*] Spawning Nanobot Factory..."
cat << 'FACTORY' > $VAULT/spawn_scouts.sh
#!/bin/bash
mkdir -p /mnt/sentinel/workers
for i in {1..1000}; do
    ID=$(printf "%03d" $i)
    PORT=$((10000 + i))
    FILE="/mnt/sentinel/workers/hrv_$ID.sh"
    cat << SCOUT > "$FILE"
#!/bin/bash
# SCOUT OBJECT HRV_$ID
while true; do
    timeout 1 nc -l -p $PORT && echo "ACTIVE" > /tmp/hrv_$ID.stat
    if [ -f /tmp/kill_chord ]; then shred -u "\$0" && exit; fi
    sleep 30
done
SCOUT
    chmod +x "$FILE"
done
FACTORY
chmod +x $VAULT/spawn_scouts.sh

# 5. The Core Service Boot Script
echo "[*] Initializing Sentinel Core..."
cat << 'CORE' > $VAULT/sentinel_core.sh
#!/bin/bash
IFACE=$(ip route | grep default | awk '{print $5}' | head -n1)
for i in 1 33 65 129 161 193; do sudo ip addr add 10.0.8.$i/24 dev $IFACE 2>/dev/null; done
sudo service asterisk start
sudo mosquitto -d
/mnt/sentinel/spawn_scouts.sh
echo "[+] MESH ONLINE: 1,000 Scouts Ready."
CORE
chmod +x $VAULT/sentinel_core.sh

echo "[!!!] GENESIS COMPLETE. Type 's 5796' to activate."
