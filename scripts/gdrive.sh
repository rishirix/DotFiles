#!/bin/bash

echo "RCLONE - Google Drive Mounting:"
echo "1) Mount Drive"
echo "2) Unmount Drive"
read -p "-> " choice

MOUNTPOINT="$HOME/GDrive"

if [ "$choice" = "1" ]; then
    mkdir -p "$MOUNTPOINT"
    echo "Mounting Google Drive to $MOUNTPOINT..."
    rclone mount gdrive: "$MOUNTPOINT" --vfs-cache-mode writes &
    echo "Mount command issued. Press Ctrl+C to detach from log if needed."
elif [ "$choice" = "2" ]; then
    echo "Unmounting Google Drive..."
    fusermount -u "$MOUNTPOINT"
    echo "Unmounted."
else
    echo "Invalid Option"
fi

