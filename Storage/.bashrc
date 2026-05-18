# --- NOKI SYSTEM: 10.0.8.x SUBNET ---
export PATH=$PATH:/mnt/e/Python311:/mnt/e/workspace/exe-msi

# Force OpenWrt Static IP
sudo ip addr add 10.0.8.200/24 dev eth0 broadcast 10.0.8.255 2>/dev/null

# Aliases
alias python='/mnt/e/Python311/python.exe'
alias noki='/mnt/e/Python311/python.exe /mnt/e/workspace/scripts/noki_body.py'

# Fixed Mount Command
mount-portals() {
    sudo mkdir -p /mnt/e /mnt/f
    sudo mount -t drvfs E: /mnt/e 2>/dev/null
    sudo mount -t drvfs F: /mnt/f 2>/dev/null
    echo "Portals Linked to 10.0.8.200"
}

mount-portals

# Remove missing Windows drives from the PATH
export PATH=$(echo $PATH | tr ':' '\n' | grep -v "/mnt/[dg]/" | tr '\n' ':' | sed 's/:$//')

# --- NOBLE PERSISTENCE BLOCK ---
# Auto-launch sidebar on login
alias s='/opt/sovereign/master_menu.sh'

# Created by `pipx` on 2026-05-04 06:36:23
export PATH="$PATH:/home/m2n2/.local/bin"
