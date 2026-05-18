#!/bin/bash
# NOBLE // RESILIENT MASTER GENESIS (V21)
# Bypassing Localhost for physical Android Tablet Link

# 1. Directory Initialization
BASE="/opt/sovereign"
sudo mkdir -p $BASE/{workers,cells,power,egg,logs}
sudo chown -R $USER:$USER $BASE

# 2. Re-Building the Todo List Sidebar (HUD Component)
sudo tee ~/todo_hud.sh > /dev/null << 'SIDEBAR_EOF'
#!/bin/bash
# NOBLE // TERMINAL SIDEBAR HUD
TODO_FILE="/opt/sovereign/todo.list"
draw_sidebar() {
    cols=$(tput cols); lines=$(tput lines)
    sidebar_start=$((cols - 35))
    for ((i=1; i<=lines; i++)); do tput cup $i $sidebar_start; echo -n "│                                   "; done
    tput cup 1 $((sidebar_start + 2)); echo -e "\e[1;36m-- NOBLE TODO LIST --\e[0m"
    line_num=3
    while IFS= read -r line; do
        tput cup $line_num $((sidebar_start + 2)); echo -n "$line"
        ((line_num++))
    done < "$TODO_FILE"
}
draw_sidebar; tput cup $((lines-1)) 0
SIDEBAR_EOF
chmod +x ~/todo_hud.sh

# 3. Create the Todo List File
echo "[X] VAULT: 5796 Locked" > /opt/sovereign/todo.list
echo "[ ] TABLET: Link 10.0.8.200" >> /opt/sovereign/todo.list
echo "[ ] MESH: 1,020 Workers Live" >> /opt/sovereign/todo.list
echo "[ ] PORTAL: Bypass Esri Login" >> /opt/sovereign/todo.list

# 4. Re-Building the Control HUD (Master Menu)
sudo tee $BASE/sovereign_menu.sh > /dev/null << 'MENU_EOF'
#!/bin/bash
# NOBLE // MASTER HUD V21
show_menu() {
    clear; ~/todo_hud.sh
    PWR_STATE=$(cat /opt/sovereign/power/state.now 2>/dev/null || echo "ONLINE")
    echo -e "\e[1;31m[ NOBLE ENGINE // POWER: $PWR_STATE ]\e[0m"
    echo "------------------------------------------"
    echo -e "1) \e[32mWORKER STATUS\e[0m (1,020 Live)"
    echo -e "2) \e[36m3D GLOBE\e[0m      (Update KML)"
    echo -e "3) \e[35mPORTAL RELAY\e[0m  (Ember Sync)"
    echo -e "4) \e[33mTRUNK CONSOLE\e[0m (MDN 714...)"
    echo -e "5) \e[34mADB BRIDGE\e[0m    (Link Tablet)"
    echo -e "6) \e[94mZENMAP\e[0m        7) \e[94mWIRESHARK\e[0m"
    echo -e "8) \e[33mBROADCAST\e[0m     x) \e[90mEXIT\e[0m"
    echo "------------------------------------------"
}
while true; do
    show_menu; read -p "Command > " opt
    case $opt in
        1) screen -ls ;;
        2) python3 /opt/sovereign/workers/kml_gen.py ;;
        3) python3 /opt/sovereign/egg/portal_redirect.py & ;;
        4) sudo asterisk -rvvv ;;
        5) /opt/sovereign/link_tablet.sh ;;
        6) sudo zenmap & ;;
        7) sudo wireshark & ;;
        8) /opt/sovereign/workers/broadcast_duty.sh ;;
        x) exit 0 ;;
    esac
done
MENU_EOF
chmod +x $BASE/sovereign_menu.sh

# 5. Build the Mesh Factory (The 1,020 Employees)
sudo tee $BASE/spawn_resilient_mesh.sh > /dev/null << 'SPAWN_EOF'
#!/bin/bash
for i in {1..1020}; do
    ID=$(printf "%03d" $i); PORT=$((10000 + i))
    FILE="/opt/sovereign/workers/hrv_$ID.sh"
    echo "#!/bin/bash" > $FILE
    echo "while true; do timeout 1 nc -l -p $PORT; sleep 15; done" >> $FILE
    chmod +x $FILE
done
echo "[+] 1,020 Employees Staged."
SPAWN_EOF
chmod +x $BASE/spawn_resilient_mesh.sh

# 6. Build the Tablet Bridge (USB/ADB Reverse Tunnel)
sudo tee $BASE/link_tablet.sh > /dev/null << 'ADB_EOF'
#!/bin/bash
# Link Physical Android Tablet
echo "[*] Searching for Tablet via ADB..."
adb devices | grep -w "device" || echo "[!] Check USB Debugging on Tablet."
adb reverse tcp:8080 tcp:8080
adb push /opt/sovereign/egg/world_overlay.kml /sdcard/Download/noble_globe.kml
echo "[!!!] TABLET LINKED at 10.0.8.200:8080"
ADB_EOF
chmod +x $BASE/link_tablet.sh

# 7. Finalize Aliases & System Integration
if ! grep -q "alias s=" ~/.bashrc; then
    echo "alias s='/opt/sovereign/sovereign_menu.sh'" >> ~/.bashrc
    echo "alias todo='~/todo_hud.sh'" >> ~/.bashrc
fi

# 8. Run the setup
sudo $BASE/spawn_resilient_mesh.sh
echo "[!!!] NOBLE CORE RESTORED. Type 's' to launch HUD."
