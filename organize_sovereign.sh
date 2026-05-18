#!/bin/bash
# MNL2 Sovereign Core: Asset Consolidation

# 1. Create Clean Structure
mkdir -p ~/OSI_Vault/{L1_Phys,L2_Link,L3_Net,L4_Trans,L7_App} ~/Archive/Tesla_Bloat

# 2. Purge Windows Metadata (Zone.Identifier files)
find . -name "*:Zone.Identifier" -delete

# 3. Consolidate Tesla Assets (L7)
mv *tesla* decompile_tesla.sh audit_tesla.sh rebuild_tesla_fixed.sh ~/OSI_Vault/L7_App/ 2>/dev/null
mv base.apk baksmali.jar *.zip ~/OSI_Vault/L7_App/Research/ 2>/dev/null

# 4. Consolidate OpenWrt & Networking (L3/L4)
mv openwrt.img stage_openwrt.sh launch_wrt_simple.sh setup_iscsi_target.sh ~/OSI_Vault/L3_Net/ 2>/dev/null
mv *tunnel* *bridge* site-C.sh ~/OSI_Vault/L4_Trans/ 2>/dev/null

# 5. Consolidate GIS & KML (L1/L7)
mv *.kml *.html ~/OSI_Vault/L1_Phys/ 2>/dev/null

# 6. Merge Duplicate Fixes into a 'Master Fix' directory
mv fix_*.sh noble_master_fix.sh ~/OSI_Vault/L7_App/Maintenance/ 2>/dev/null

echo "[+] Sovereign Assets Organized. Duplicates purged."
