# =============================================================================
#                    Script Name   : monitor_file.sh                            
#                    Version       : 1.1                                        
#                    Author        : Vishal Bobhate                             
#                    Created on    : 22-Oct-2025                               
#                    Purpose       : Monitor a file for changes                  
###############################################################################

#!/bin/bash

FILE="$1"

if [ -z "$FILE" ]; then
    read -p "Enter the file name to monitor: " FILE
fi

if [ ! -f "$FILE" ]; then
    echo "Error: File '$FILE' does not exist."
    
fi

echo " Waiting for changes in '$FILE'..."

inotifywait -m -e modify "$FILE" --format '%T %e' --timefmt '%H:%M:%S' |
while read time event; do
    echo " [$time] File modified! Event: $event"
done
