#!/bin/bash
# --- 1. CONFIGURATION ---
CODESPACE_URL="cautious-space-doodle-6v59ppr76w9crqw6.github.dev"
REMOTE_PORT=1111
LOCAL_DEV="/dev/ttyUSB0"
BAUD="115200"

# --- 2. CLEAN THE FORGE (Local) ---
echo "[*] Nuking ghost processes and shadow copies..."
sudo pkill -9 socat || true
sudo docker rm -f tesla-umbilical || true

# --- 3. BUILD THE HOLLOW BRIDGE ---
echo "[*] Manifesting the Aqueous Connection Container..."
cat << EOF > Dockerfile.bridge
FROM alpine:latest
RUN apk add --no-cache socat
ENTRYPOINT ["socat", "GOPEN:$LOCAL_DEV,b$BAUD,raw,echo=0", "TCP:$CODESPACE_URL:$REMOTE_PORT"]
EOF

sudo docker build -t sov-bridge -f Dockerfile.bridge .

# --- 4. ATTACH THE UMBILICAL ---
echo "[*] Injecting Hardware Nerve to the Cloud Egg..."
# Note: Ensure you ran 'usbipd attach' in PowerShell first!
sudo docker run -d \
  --name tesla-umbilical \
  --restart always \
  --privileged \
  --device $LOCAL_DEV:$LOCAL_DEV \
  sov-bridge

# --- 5. THE WATCHDOG ---
echo "[*] Shielding the pipe. Monitoring logs..."
sudo docker logs -f tesla-umbilical
