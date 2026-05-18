#!/bin/bash
# 1. Clear Linux side (resolved)
if systemctl is-active --quiet systemd-resolved; then
    sudo resolvectl flush-caches
    echo "Linux DNS cache flushed via resolvectl."
else
    # If systemd is down, restarting the nscd daemon usually works
    sudo service nscd restart 2>/dev/null || echo "nscd not present, skipping."
fi

# 2. Instructions for the Windows Host side
echo "------------------------------------------------"
echo "Now run this in a Windows CMD/PowerShell window:"
echo "ipconfig /flushdns"
echo "------------------------------------------------"
