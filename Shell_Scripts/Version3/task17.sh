# =============================================================================
#                    Script Name   : check_ssh_failures.sh                       
#                    Version       : 2.0                                        
#                    Author        : Vishal Bobhate                             
#                    Created on    : 22-Oct-2025                                
#                    Purpose       : Report failed SSH login attempts            
###############################################################################

#!/bin/bash

function MAIL_FUNTION () {
    echo -e "Hello All
    
        This is system generated email, do not reply to this email.
    
        Server IP :- `ifconfig | grep inet | head -n 1 | awk '{print $2}'`
    
        Kindly take necessary action ASAP to avoid future inconvenience.
    
        Server Name : - `hostname`
    
        Server IP :- `ifconfig | grep inet | head -n 1 | awk '{print $2}'`

Thank & Regards
Team CloudEthix"

}


if [ $# -ne 2 ]; then
    echo "Usage: $0 <log_file_path> <output_file>"
fi
LOG_FILE=$1

if [ ! -f "$LOG_FILE" ]; then
    echo "Error: Log file '$LOG_FILE' not found."

    grep -i "failed" "$LOG_FILE" > "$OUTPUT_FILE" 2>/dev/null
    
    exit 1

elif [ $? -eq 0 ]; then
    echo "Failed SSH login attempts saved to '$OUTPUT_FILE'."
else
    echo "No failed SSH login attempts found."
fi