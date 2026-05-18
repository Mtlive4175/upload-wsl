#!/bin/bash
# Forensic Watcher for ~/fore/
WATCH_DIR="$HOME/fore"
LOG_DIR="$HOME/fore/reports"
mkdir -p "$LOG_DIR"

echo "Watcher started on $WATCH_DIR..."
echo "Drop files in here to auto-process. Press [CTRL+C] to stop."

# Pre-check for tools
pkg install pngcheck exiftool -y --no-upgrade > /dev/null 2>&1

# Infinite loop to check for new files
while true; do
    for file in "$WATCH_DIR"/*; do
        # Skip directories, the script itself, and existing reports
        if [[ -f "$file" && "$file" != *"watcher.sh"* && "$file" != *"audit_image.sh"* && "$file" != *"reports"* ]]; then
            
            FILENAME=$(basename -- "$file")
            REPORT="$LOG_DIR/${FILENAME}_audit.txt"
            
            echo "[+] Processing $FILENAME..."
            
            # Run the audit and pipe to a report file
            {
                echo "AUDIT REPORT FOR: $FILENAME"
                echo "TIMESTAMP: $(date)"
                echo "--------------------------------------"
                echo -e "\n[1] FILE IDENTITY"
                file "$file"
                echo -e "\n[2] CHECKSUM"
                sha256sum "$file"
                echo -e "\n[3] METADATA"
                exiftool "$file"
                echo -e "\n[4] STRINGS"
                strings "$file" | head -n 20
                echo -e "\n[5] STRUCTURE"
                exiftool -validate -warning -error "$file"
            } > "$REPORT" 2>&1

            # Move the processed original to a 'processed' subfolder to avoid re-scanning
            mkdir -p "$WATCH_DIR/processed"
            mv -- "$file" "$WATCH_DIR/processed/"
            echo "[!] Done. Report saved to: reports/${FILENAME}_audit.txt"
        fi
    done
    sleep 2
done
