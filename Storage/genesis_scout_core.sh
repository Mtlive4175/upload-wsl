#!/bin/bash
# NOBLE // SCOUT CORE & INSEEGO eSIM BRIDGE

# 1. Setup Vault & Directories
VAULT="/mnt/sentinel"
WORKERS="$VAULT/workers"
sudo mkdir -p $WORKERS
sudo chown -R $USER:$USER $VAULT

# 2. Inseego Hardware Profile (9900 1805 0692 320)
IMEI="990018050692320"
MDN="714-555-2026"

# 3. Build the 1,000-Contact Phone Book
echo "[*] Building Phone Book for 1,000 Scouts..."
echo "Worker_ID,Virtual_MAC,Port,SIP_Extension,Status,Last_Harvest,Latitude,Longitude" > $WORKERS/phonebook.csv

for i in {1..1000}; do
    ID=$(printf "%03d" $i)
    MAC=$(printf '00:60:2F:%02X:%02X:%02X' $((RANDOM%256)) $((RANDOM%256)) $i)
    PORT=$((10000 + i))
    SIP=$((7000 + i))
    LAT=$(awk 'BEGIN{srand(); print 40.7128 + (rand() * 0.005)}')
    LON=$(awk 'BEGIN{srand(); print -74.0060 + (rand() * 0.005)}')
    echo "HRV_$ID,$MAC,$PORT,$SIP,IDLE,N/A,$LAT,$LON" >> $WORKERS/phonebook.csv
done

# 4. Asterisk eSIM/MDN Registration
echo "[*] Bridging MDN $MDN to Inseego ($IMEI)..."
sudo tee /etc/asterisk/pjsip.conf << ASTERISK_EOF
[transport-udp]
type=transport
protocol=udp
bind=0.0.0.0

[$MDN]
type=aor
max_contacts=1

[$MDN]
type=auth
auth_type=password
password=noble_voice_2026
username=$MDN

[$MDN]
type=endpoint
context=from-inseego
disallow=all
allow=ulaw
auth=$MDN
outbound_auth=$MDN
aors=$MDN
ASTERISK_EOF

# 5. The Scout Nanobot Factory
cat << 'FACTORY' > $VAULT/spawn_scouts.sh
#!/bin/bash
for i in {1..1000}; do
    ID=$(printf "%03d" $i)
    PORT=$((10000 + i))
    FILE="/mnt/sentinel/workers/hrv_$ID.sh"
    cat << SCOUT > "$FILE"
#!/bin/bash
# SCOUT HRV_$ID (Worker)
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

sudo service asterisk restart
echo "[!!!] SCOUT CORE INITIALIZED."
