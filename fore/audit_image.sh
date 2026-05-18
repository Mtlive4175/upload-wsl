#!/bin/bash
# Using $HOME ensures the script knows exactly where it is
TARGET_DIR="$HOME/fore"
FILE_NAME="-4913362151732893971.png"
FULL_PATH="$TARGET_DIR/$FILE_NAME"

# Check for the file using a relative path to handle the leading dash
cd "$TARGET_DIR"

if [ ! -f "./$FILE_NAME" ]; then
    echo "ERROR: File $FILE_NAME not found in $TARGET_DIR"
    ls -la
    exit 1
fi

echo "--- [1] FILE IDENTITY ---"
file "./$FILE_NAME"

echo -e "\n--- [2] CHECKSUMS (SHA256) ---"
sha256sum "./$FILE_NAME"

echo -e "\n--- [3] METADATA (EXIF) ---"
exiftool "./$FILE_NAME"

echo -e "\n--- [4] STRING ANALYSIS (TOP 15) ---"
strings "./$FILE_NAME" | head -n 15

echo -e "\n--- [5] BINARY STRUCTURE ---"
pngcheck -v "./$FILE_NAME"
