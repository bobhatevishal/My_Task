# =============================================================================
#                    Script Name   : check_ssh_failures.sh                       
#                    Version       : 2.0                                        
#                    Author        : Vishal Bobhate                             
#                    Created on    : 22-Oct-2025                                
#                    Purpose       : Report failed SSH login attempts            
###############################################################################

#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Usage: $0 <log_file_path> <output_file>"

fi

LOG_FILE=$1
OUTPUT_FILE=$2

if [ ! -f "$LOG_FILE" ]; then
    echo "Error: Log file '$LOG_FILE' not found."
fi

grep -i "failed" "$LOG_FILE" > "$OUTPUT_FILE" 2>/dev/null

if [ $? -eq 0 ]; then
    echo "Failed SSH login attempts saved to '$OUTPUT_FILE'."
else
    echo "No failed SSH login attempts found."
fi
