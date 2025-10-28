# =============================================================================
#                    Script Name   : daily_log_email.sh                          
#                    Version       : 2.0                                         
#                    Author        : Vishal Bobhate                              
#                    Created on    : 22-Oct-2025                                 
#                    Purpose       : Send daily system log summary via email     
###############################################################################

#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Usage: $0 <email_address> <log_file_path>"
fi
EMAIL=$1
LOG_FILE=$2
SUBJECT="Daily System Log Summary - $(date '+%Y-%m-%d')"

if [ ! -f "$LOG_FILE" ]; then
    echo "Error: Log file '$LOG_FILE' not found."
fi

tail -n 10 "$LOG_FILE" | mail -s "$SUBJECT" "$EMAIL"


if [ $? -eq 0 ]; then
    echo "Daily log summary sent to $EMAIL."
else
    echo "Failed to send email. Please check your mail configuration."

fi
