#!/bin/bash

# Define Project Directories
PROJECTS=(
    "Project_Tesla_Audits"
    "Project_Sovereign_Mesh"
    "Project_IoT_Eggs"
    "Project_Network_Recon"
    "Project_Lab_Staging"
)

# Create folders
for p in "${PROJECTS[@]}"; do mkdir -p "$HOME/$p"; done

echo "Scanning and sorting by project..."

# 1. Project Tesla Audits (APK/Smali/Firmware)
mv TeslaM_* baksmali.jar base.apk ignite_zygote.sh "$HOME/Project_Tesla_Audits/" 2>/dev/null

# 2. Project Sovereign Mesh (P2P/Handshake/Mesh logic)
mv ghost_mesh.py sovereign_*.sh stealth_sovereign.sh known_workers.txt "$HOME/Project_Sovereign_Mesh/" 2>/dev/null

# 3. Project IoT Eggs (Board logic/VFS/ESP)
mv *egg* iot_ssd.bin board_egg.py nas_egg.py provision_kinetic_workers.sh "$HOME/Project_IoT_Eggs/" 2>/dev/null

# 4. Project Network Recon (OpenWrt/Scanning/Drone logic)
mv openwrt* start_travel_router.sh sniffer.js drone_bind_logic.js mnl_recon_tool.py stealth_recon.py "$HOME/Project_Network_Recon/" 2>/dev/null

# 5. Project Lab Staging (Classwork/IT Labs)
mv it_lab_staging init_staging_lab.sh setup_weblabs_vfs.sh setup_surgery.sh corporate_takeover.sh "$HOME/Project_Lab_Staging/" 2>/dev/null

# Cleanup residual archives
mkdir -p "$HOME/Project_Archives"
mv Archive scrub_and_archive.sh cloudflared.deb "$HOME/Project_Archives/" 2>/dev/null

echo "Organization by project complete."
