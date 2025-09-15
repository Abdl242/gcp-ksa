#!/bin/bash

# Get the result and extract unit file/service names
output=$(systemctl list-units --type=service --no-pager | grep wsl)

# Extract possible file/service names (1st column, which is typically 'wsl-*.service')
service_files=$(echo "$output" | awk '{print $1}')

# Variable to track if any files were removed
removed_any=0

for svc in $service_files; do
    # Remove .service extension, try possible related files
    fname="/etc/systemd/system/$svc"
    if [ -f "$fname" ]; then
        rm -f "$fname"
        echo "Removed: $fname"
        removed_any=1
    fi
done

if [ $removed_any -eq 0 ]; then
    echo "No files to remove."
fi
