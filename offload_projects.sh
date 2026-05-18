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
