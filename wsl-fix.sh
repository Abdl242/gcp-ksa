#!/bin/bash

output=$(sudo find /etc/systemd /lib/systemd -name '*wsl-pro*')

removed_any=0

for svc in $output; do
    if [ -f "$svc" ]; then
        sudo rm -f "$svc"
        echo "Removed: $svc"
        removed_any=1
    fi
done

if [ $removed_any -eq 0 ]; then
    echo "No files to remove."
fi
