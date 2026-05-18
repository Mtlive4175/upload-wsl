#!/bin/bash
# NOBLE // MASTER EXECUTION CORE V19
# Handles permissions, spawning, and 3D Globe Link

BASE="/opt/sovereign"

echo "[*] Claiming Root Authority..."
sudo chown -R $USER:$USER $BASE

# 1. Finalizing Permissions
echo "[*] Granting Execution Rights..."
sudo chmod +x $BASE/*.sh $BASE/power/*.sh $BASE/workers/*.sh 2>/dev/null

# 2. Spawning the 1,020 Department Employees (Workers)
echo "[*] Deploying 1,020 Department Employees..."
sudo $BASE/spawn_resilient_mesh.sh

# 3. Initializing IoT Power State
echo "[*] Synchronizing Power Harvesters..."
sudo $BASE/power/generator_status.sh

# 4. Igniting the Engine
echo "[*] Igniting Noble Engine..."
sudo $BASE/sentinel_core.sh

# 5. Building the 3D Globe Overlay (Bypassing Login)
echo "[*] Constructing 3D World Layer..."
sudo tee $BASE/egg/world_overlay.kml > /dev/null << 'KML_EOF'
<?xml version="1.0" encoding="UTF-8"?>
<kml xmlns="http://www.opengis.net/kml/2.2">
<Folder>
  <name>Noble 3D Globe</name>
  <visibility>1</visibility>
  <NetworkLink>
    <name>Live Department Mesh</name>
    <Link>
      <href>\\wsl.localhost\Ubuntu\opt\sovereign\workers\active_mesh.kml</href>
      <refreshMode>onInterval</refreshMode>
      <refreshInterval>2</refreshInterval>
    </Link>
  </NetworkLink>
</Folder>
</kml>
KML_EOF

# 6. Linking to ArcGIS Earth (Windows Path)
echo "[*] Linking Tablet/Windows Assets..."
cp $BASE/egg/world_overlay.kml /mnt/c/Users/m2n2/Documents/ArcGISEarth/

echo "[!!!] NOBLE CORE STABILIZED. 1,020 Workers Live."
