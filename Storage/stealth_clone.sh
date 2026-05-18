#!/bin/bash
# Mimics a standard Chrome browser on Windows to avoid WAF detection
TARGET_URL=$1
cat << 'HERESTRING'
Cloning $TARGET_URL with stealth headers...
HERESTRING
wget --mirror \
     --convert-links \
     --adjust-extension \
     --page-requisites \
     --no-parent \
     --user-agent="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36" \
     -e robots=off \
     $TARGET_URL
