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
EOF

chmod +x ~/energize_sc_fixed.sh
~/energize_sc_fixed.sh
python3 << 'EOF'
import os
import subprocess

def run_gaming_hud():
    # Style constants for the 'Gaming' feel
    HEADER = '\033[95m'
    OKBLUE = '\033[94m'
    OKCYAN = '\033[96m'
    WARNING = '\033[93m'
    FAIL = '\033[91m'
    ENDC = '\033[0m'
    BOLD = '\033[1m'

    print(f"{HEADER}{BOLD}=== [ SOVEREIGN_HUD_INITIALIZED ] ==={ENDC}")
    print(f"{OKCYAN}[*] Target: com.teslamotors.tesla{ENDC}")

    # Checking for Tesla Data Path
    tesla_path = "/data/data/com.teslamotors.tesla"
    
    if os.path.exists(tesla_path):
        print(f"{OKBLUE}[+] Data Node Detected. Extracting UID...{ENDC}")
        # Command execution to get UID
        uid_cmd = f"stat -c %u {tesla_path}"
        uid = subprocess.getoutput(uid_cmd)
        print(f"{OKCYAN}[>>>] TESLA_UID: {uid}{ENDC}")
        
        # Deployment of the SC_DATA link
        print(f"{OKBLUE}[*] Mapping SC_DATA link to Home...{ENDC}")
        os.system(f"ln -s {tesla_path} ~/SC_DATA")
        print(f"{OKBLUE}[*] Granting X-plore permissions...{ENDC}")
        os.system(f"chmod 777 {tesla_path}")
        print(f"{HEADER}{BOLD}=== [ LINK_ESTABLISHED ] ==={ENDC}")
    else:
        print(f"{FAIL}[!] ERROR: Path '{tesla_path}' not found.{ENDC}")
        print(f"{WARNING}[?] Check if the Tesla app is installed or if root is active.{ENDC}")

if __name__ == "__main__":
    run_gaming_hud()
EOF

python3 << 'EOF'
import os
import subprocess

def run_gaming_hud():
    # Style constants for the 'Gaming' feel
    HEADER = '\033[95m'
    OKBLUE = '\033[94m'
    OKCYAN = '\033[96m'
    WARNING = '\033[93m'
    FAIL = '\033[91m'
    ENDC = '\033[0m'
    BOLD = '\033[1m'

    print(f"{HEADER}{BOLD}=== [ SOVEREIGN_HUD_INITIALIZED ] ==={ENDC}")
    print(f"{OKCYAN}[*] Target: com.teslamotors.tesla{ENDC}")

    # Checking for Tesla Data Path
    tesla_path = "/data/data/com.teslamotors.tesla"
    
    if os.path.exists(tesla_path):
        print(f"{OKBLUE}[+] Data Node Detected. Extracting UID...{ENDC}")
        # Command execution to get UID
        uid_cmd = f"stat -c %u {tesla_path}"
        uid = subprocess.getoutput(uid_cmd)
        print(f"{OKCYAN}[>>>] TESLA_UID: {uid}{ENDC}")
        
        # Deployment of the SC_DATA link
        print(f"{OKBLUE}[*] Mapping SC_DATA link to Home...{ENDC}")
        os.system(f"ln -s {tesla_path} ~/SC_DATA")
        print(f"{OKBLUE}[*] Granting X-plore permissions...{ENDC}")
        os.system(f"chmod 777 {tesla_path}")
        print(f"{HEADER}{BOLD}=== [ LINK_ESTABLISHED ] ==={ENDC}")
    else:
        print(f"{FAIL}[!] ERROR: Path '{tesla_path}' not found.{ENDC}")
        print(f"{WARNING}[?] Check if the Tesla app is installed or if root is active.{ENDC}")

if __name__ == "__main__":
    run_gaming_hud()
EOF

python3 << 'EOF'
import os
import subprocess

def run_gaming_hud():
    # Style constants for the 'Gaming' feel
    HEADER = '\033[95m'
    OKBLUE = '\033[94m'
    OKCYAN = '\033[96m'
    WARNING = '\033[93m'
    FAIL = '\033[91m'
    ENDC = '\033[0m'
    BOLD = '\033[1m'

    print(f"{HEADER}{BOLD}=== [ SOVEREIGN_HUD_INITIALIZED ] ==={ENDC}")
    print(f"{OKCYAN}[*] Target: com.teslamotors.tesla{ENDC}")

    # Checking for Tesla Data Path
    tesla_path = "/data/data/com.teslamotors.tesla"
    
    if os.path.exists(tesla_path):
        print(f"{OKBLUE}[+] Data Node Detected. Extracting UID...{ENDC}")
        # Command execution to get UID
        uid_cmd = f"stat -c %u {tesla_path}"
        uid = subprocess.getoutput(uid_cmd)
        print(f"{OKCYAN}[>>>] TESLA_UID: {uid}{ENDC}")
        
        # Deployment of the SC_DATA link
        print(f"{OKBLUE}[*] Mapping SC_DATA link to Home...{ENDC}")
        os.system(f"ln -s {tesla_path} ~/SC_DATA")
        print(f"{OKBLUE}[*] Granting X-plore permissions...{ENDC}")
        os.system(f"chmod 777 {tesla_path}")
        print(f"{HEADER}{BOLD}=== [ LINK_ESTABLISHED ] ==={ENDC}")
    else:
        print(f"{FAIL}[!] ERROR: Path '{tesla_path}' not found.{ENDC}")
        print(f"{WARNING}[?] Check if the Tesla app is installed or if root is active.{ENDC}")

if __name__ == "__main__":
    run_gaming_hud()
EOF

python3 << 'EOF'
import os
import subprocess

def run_gaming_hud():
    # Style constants for the 'Gaming' feel
    HEADER = '\033[95m'
    OKBLUE = '\033[94m'
    OKCYAN = '\033[96m'
    WARNING = '\033[93m'
    FAIL = '\033[91m'
    ENDC = '\033[0m'
    BOLD = '\033[1m'

    print(f"{HEADER}{BOLD}=== [ SOVEREIGN_HUD_INITIALIZED ] ==={ENDC}")
    print(f"{OKCYAN}[*] Target: com.teslamotors.tesla{ENDC}")

    # Checking for Tesla Data Path
    tesla_path = "/data/data/com.teslamotors.tesla"
    
    if os.path.exists(tesla_path):
        print(f"{OKBLUE}[+] Data Node Detected. Extracting UID...{ENDC}")
        # Command execution to get UID
        uid_cmd = f"stat -c %u {tesla_path}"
        uid = subprocess.getoutput(uid_cmd)
        print(f"{OKCYAN}[>>>] TESLA_UID: {uid}{ENDC}")
        
        # Deployment of the SC_DATA link
        print(f"{OKBLUE}[*] Mapping SC_DATA link to Home...{ENDC}")
        os.system(f"ln -s {tesla_path} ~/SC_DATA")
        print(f"{OKBLUE}[*] Granting X-plore permissions...{ENDC}")
        os.system(f"chmod 777 {tesla_path}")
        print(f"{HEADER}{BOLD}=== [ LINK_ESTABLISHED ] ==={ENDC}")
    else:
        print(f"{FAIL}[!] ERROR: Path '{tesla_path}' not found.{ENDC}")
        print(f"{WARNING}[?] Check if the Tesla app is installed or if root is active.{ENDC}")

if __name__ == "__main__":
    run_gaming_hud()
EOF

pipx install shell-gpt
sudo apt install pipx
ping google.com
sudo apt-get update --fix-missing
sudo apt-get update --fix-missing
sudo apt install pipx
pipx install shell-gpt
cat << 'EOF' > setup_weblabs_vfs.sh
#!/bin/bash
# 1. Rename the file for your single-file WebLabs
# Based on your directory in image_b740b7.png
cd /var/www/html/
mv WebApps.vhdx WebLabs.vhdx

# 2. Update iSCSI Target with the new name
# We are 'side-attaching' this to your thin-air space
sudo tgtadm --lld iscsi --op new --mode target --tid 2 -T iqn.2026-05.it-lab:weblabs
sudo tgtadm --lld iscsi --op new --mode logicalunit --tid 2 --lun 1 -b /var/www/html/WebLabs.vhdx
sudo tgtadm --lld iscsi --op bind --mode target --tid 2 -I ALL

# 3. Mount and Format in the Staging Container
# Discover and login to the new WebLabs target
sudo iscsiadm -m discovery -t st -p 127.0.0.1
sudo iscsiadm -m node -T iqn.2026-05.it-lab:weblabs -p 127.0.0.1 -l

# Format as EXT4 for the VFS layer
# (Check /dev/sdX to ensure you have the right disk)
sudo mkfs.ext4 /dev/sdc 
mkdir -p /mnt/it_lab/weblabs
sudo mount /dev/sdc /mnt/it_lab/weblabs

# 4. Final Permissions
sudo chown -R $USER:$USER /mnt/it_lab/weblabs
echo "WebLabs volume is live at /mnt/it_lab/weblabs"
EOF

chmod +x setup_weblabs_vfs.sh
./setup_weblabs_vfs.sh
sudo fuser -k 6942/tcp
/bin/bash <<< "
# Start the Target Daemon
sudo tgtd
# Start the iSCSI Initiator Daemon
sudo iscsid
# Clear the permissions for the mount point
sudo mkdir -p /mnt/it_lab/weblabs
sudo chown -R $USER:$USER /mnt/it_lab
"
/bin/bash <<< "
# Start the Target Daemon
sudo tgtd
# Start the iSCSI Initiator Daemon
sudo iscsid
# Clear the permissions for the mount point
sudo mkdir -p /mnt/it_lab/weblabs
sudo chown -R $USER:$USER /mnt/it_lab
"
pipx ensurepath
source ~/.bashrc
systemctl is-system-running
cat << 'EOF' > start_sovereign_gui.sh
#!/bin/bash
# Start background logic
nohup ./Project_Network_Recon/start_travel_router.sh > router.log 2>&1 &
nohup ./Project_Lab_Staging/setup_weblabs_vfs.sh > vfs.log 2>&1 &

# Start the Web GUI on Port 9000
node -e "
const express = require('express');
const app = express();
app.get('/', (req, res) => {
    res.send('<h1>Sovereign Dashboard</h1><p>Router: ACTIVE</p><p>Lab VFS: MOUNTED</p>');
});
app.listen(9000, '0.0.0.0', () => console.log('GUI Live on Port 9000'));
"
EOF

chmod +x start_sovereign_gui.sh
./start_sovereign_gui.sh
ifconfig
lsblk
# Create mount points
sudo mkdir -p /mnt/matrix_core
ls -lh /mnt/matrix_core
ls -lh /mnt/matrix_system
sudo mkdir -p /mnt/matrix_core
sudo mount /dev/sda /mnt/matrix_core
ls -lh
# Look for hidden files
ls -la /mnt/matrix_core
# Check what the kernel thinks the filesystem is
lsblk -f
touch ~/testfile && rm ~/testfile
lsblk -f
sudo umount /mnt/matrix_core 2>/dev/null
sudo mount -t ext4 /dev/sda /mnt/matrix_core
lsblk -f
ls -la /mnt/matrix_core
ls -la /mnt/matrix_system
lsblk -f
ls -la /mnt/matrix_core
ls -la /mnt/matrix_system
# Only run this if the folders are still empty after mounting
sudo fsck -y /dev/sda
sudo umount -f /dev/sda 2>/dev/null
sudo fsck -p /dev/sda
# Re-create folders
sudo mkdir -p /mnt/matrix_core
df -h | grep matrix
clear
cp /mnt/c/Users/m2n2/Downloads/gauth-export.json /mnt/i/
cp "/mnt/c/Users/m2n2/Documents/Microsoft Edge Passwords.csv" /mnt/i/
df -h /mnt/c
# Check your internal WSL space first
df -h /
# Run a quick check for any massive files (>100MB) we might have missed
find ~ -type f -size +100M
sudo apt update && sudo apt install fdupes -y
fdupes -rdN /home/m2n2/ /home/m2n2/gdrive/ /home/m2n2/OSI_Vault/
cat << 'EOF' > ~/offload_sync.sh
#!/bin/bash
# Define paths
SOURCE_DIR="/home/m2n2"
DEST_DIR="/mnt/i/Organized_Backups_$(date +%Y%m%d)"
mkdir -p "$DEST_DIR"

echo "[*] Compressing Sovereign Infrastructure..."
tar -czf "$DEST_DIR/sovereign_core.tar.gz" -C "$SOURCE_DIR" gdrive Sovereign_Ghost

echo "[*] Compressing Network & Lab Assets..."
tar -czf "$DEST_DIR/it_labs.tar.gz" -C "$SOURCE_DIR" OSI_Vault it_lab_staging Project_IoT_Eggs

echo "[*] Moving credentials..."
cp "$SOURCE_DIR/gauth-export.json" "$DEST_DIR/"
echo "[*] Offload complete. Files located at $DEST_DIR"
EOF

chmod +x ~/offload_sync.sh
./~/offload_sync.shcat << 'EOF' > ~/offload_sync.sh
#!/bin/bash
# Define paths
SOURCE_DIR="/home/m2n2"
DEST_DIR="/mnt/i/Organized_Backups_$(date +%Y%m%d)"
mkdir -p "$DEST_DIR"

echo "[*] Compressing Sovereign Infrastructure..."
tar -czf "$DEST_DIR/sovereign_core.tar.gz" -C "$SOURCE_DIR" gdrive Sovereign_Ghost

echo "[*] Compressing Network & Lab Assets..."
tar -czf "$DEST_DIR/it_labs.tar.gz" -C "$SOURCE_DIR" OSI_Vault it_lab_staging Project_IoT_Eggs

echo "[*] Moving credentials..."
cp "$SOURCE_DIR/gauth-export.json" "$DEST_DIR/"
echo "[*] Offload complete. Files located at $DEST_DIR"
EOF

chmod +x ~/offload_sync.sh
./~/offload_sync.sh
~/offload_sync.sh
# -l: Create hard links instead of deleting
# -r: Recursive
# -d: Delete duplicates
# -N: No prompt (preserves the first file)
fdupes -rldN /home/m2n2/.local/share/pipx/venvs/
# Check if those big sovereign images are duplicates
fdupes -rS ~/gdrive/ ~/OSI_Vault/
cat << 'EOF' > ~/offload_projects.sh
#!/bin/bash
TIMESTAMP=$(date +%Y%m%d_%H%M)
BACKUP_PATH="/mnt/i/Archive_$TIMESTAMP"
mkdir -p "$BACKUP_PATH"

echo "[*] Archiving Sovereign Mesh & Gdrive assets..."
tar -czf "$BACKUP_PATH/sovereign_mesh.tar.gz" -C /home/m2n2 gdrive Sovereign_Ghost

echo "[*] Archiving Network Labs & IoT Eggs..."
tar -czf "$BACKUP_PATH/net_labs.tar.gz" -C /home/m2n2 OSI_Vault Project_IoT_Eggs it_lab_staging

echo "[*] Verifying backups on I: drive..."
ls -lh "$BACKUP_PATH"
echo "[!] Done. You can now safely rm the originals in WSL to free up C: drive space."
EOF

chmod +x ~/offload_projects.sh
~/offload_projects.sh
ollama serve
ollama run phi3-mini
sudo snap install ollama
# 1. Install dependencies (if not already there)
npm install zeromq
# 2. Create the Client script using a Heredoc
cat << 'EOF' > client_1.js
const zmq = require("zeromq");
const crypto = require("crypto");

// The Handshake Configuration from our Engine
const config = {
  ip: "127.0.0.1", // Change this to your Engine's IP if it's on a different device
  task_port: 61203,
  key: "4f82c9a2-bc1d4e339a7f55b2d10e82c1",
  scheme: "sha256"
};

async function sendCommand(command) {
  const sock = new zmq.Request();
  sock.connect(`tcp://${config.ip}:${config.task_port}`);
  
  // Create HMAC Signature for security
  const signature = crypto
    .createHmac(config.scheme, config.key)
    .update(command)
    .digest("hex");

  console.log(`[Client 1] Sending Signed Command: ${command}`);
  
  // Send the command with the signature
  await sock.send(JSON.stringify({ cmd: command, sig: signature }));

  const [result] = await sock.receive();
  console.log(`[Engine Response]: ${result.toString()}`);
  
  sock.close();
}

// Example: Trigger a check on the mesh status
sendCommand("CHECK_MESH_STATUS");
EOF

# 3. Run the client
node client_1.js
ls
ls
unzip fore.zip
cd fore
cat << 'EOF' > fix_watcher.sh
#!/usr/bin/env bash
# Update package repo and install missing structural validation tool
pkg update -y && pkg install pngcheck -y

# Verify installation path and execution permissions
if command -v pngcheck &> /dev/null; then
    echo "[SUCCESS] pngcheck is now installed and operational."
    # Manually test structural integrity on one of the staged assets
    pngcheck /data/data/com.termux/files/home/fore/5683547254225477405.png
else
    echo "[ERROR] Failed to install pngcheck. Check internet connection or repository sources."
fi
EOF

chmod +x fix_watcher.sh
./fix_watcher.sh && rm fix_watcher.sh
cat << 'EOF' > fix_watcher.sh
#!/usr/bin/env bash

echo "[*] Detecting environment and updating package repository..."
# Use apt instead of Termux's pkg wrapper for standard Linux/WSL
sudo apt update -y && sudo apt install pngcheck -y

# Verify installation path and execution permissions
if command -v pngcheck &> /dev/null; then
    echo "[SUCCESS] pngcheck is now installed and operational."
    
    # Dynamically locate the PNG file in the current directory instead of using the Termux path
    TARGET_IMG="5683547254225477405.png"
    
    if [ -f "$TARGET_IMG" ]; then
        echo "[*] Manually testing structural integrity on: $TARGET_IMG"
        pngcheck "$TARGET_IMG"
    else
        echo "[WARNING] $TARGET_IMG not found in the current directory. Check your file placement."
    fi
else
    echo "[ERROR] Failed to install pngcheck. Check internet connection or repository sources."
fi
EOF

chmod +x fix_watcher.sh
./fix_watcher.sh && rm fix_watcher.sh
cat << 'EOF' > unghost_machine.sh
#!/usr/bin/env bash

echo "[*] Cleaning environment bloat and updating package cache..."
# Purge any accidental lockfiles or broken installation state, then pull apt packages
sudo apt-get update -y && sudo apt-get install -y pngcheck exiftool

# Identify the working directory path on WSL
CURRENT_PATH=$(pwd)

# Debloat and fix watcher.sh if it exists in the directory
if [ -f "watcher.sh" ]; then
    echo "[*] Rewriting internal paths to unghost local operations..."
    
    # Strip out the Termux environment prefix and point directly to the current working directory
    sed -i "s|/data/data/com.termux/files/home/fore|$CURRENT_PATH|g" watcher.sh
    # Replace any accidental 'pkg install' lines inside text/scripts with apt equivalents if found
    sed -i 's/\bpkg install\b/sudo apt install/g' watcher.sh
    sed -i 's/\bpkg update\b/sudo apt update/g' watcher.sh
    
    chmod +x watcher.sh
    echo "[SUCCESS] watcher.sh updated with native pathing: $CURRENT_PATH"
else
    echo "[!] watcher.sh not found in this immediate directory. Skipping string replacement."
fi

echo -e "\n[*] Verification of Machine Operation Ability:"
if command -v pngcheck &> /dev/null && command -v exiftool &> /dev/null; then
    echo "[STATUS] Core forensic utilities are fully unghosted and active."
    echo "--------------------------------------------------------"
    # Execute structural test on the transferred files using the active binaries
    pngcheck *.png 2>/dev/null || echo "[!] No target PNG images found in this folder to verify."
else
    echo "[ERROR] Utilities failed to provision. Check your WSL network connection."
fi
EOF

chmod +x unghost_machine.sh
./unghost_machine.sh && rm unghost_machine.sh
