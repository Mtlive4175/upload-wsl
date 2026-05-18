#!/bin/bash
# 1. Clean out the conflicts
# Moving any 'control' files out so they don't interfere with 'project'
mkdir -p ~/tesla_backups
mv ~/tesla_project/tesla_control.ino ~/tesla_backups/ 2>/dev/null

# 2. Compile the clean project
echo "Starting Noble Compile..."
arduino-cli compile --fqbn esp8266:esp8266:nodemcuv2 --output-dir ~/tesla_project/build ~/tesla_project/tesla_project.ino

# 3. Verify the file exists now
if [ -f ~/tesla_project/build/tesla_project.ino.bin ]; then
    echo "SUCCESS: Binary generated at ~/tesla_project/build/tesla_project.ino.bin"
else
    echo "ERROR: Compilation failed. Check the output above."
fi
