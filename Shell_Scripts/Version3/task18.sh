#!/bin/bash
# ==========================================================
# Script Name : monitor_file.sh
# Version     : 1.2
# Author      : Vishal Bobhate
# Purpose     : Monitor a file for changes
# ==========================================================

read -p "Enter the file name to monitor: " FILE

if [ -z "$FILE" ]; then
    echo "Error: No file name provided."
elif [ ! -f "$FILE" ]; then
    echo "Error: File '$FILE' does not exist."
else
    echo "Waiting for changes in '$FILE'..."
    inotifywait -m -e modify "$FILE" --format '%T %e' --timefmt '%H:%M:%S' |
    while read time event; do
        echo "[$time] File modified! Event: $event"
    done
fi
