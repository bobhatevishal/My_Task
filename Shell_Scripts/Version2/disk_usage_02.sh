# =============================================================================
#                    Script Name   : task2df_u.sh                              
#                    Version       : 2.0                                       
#                    Author        : Vishal Bobhate                            
#                    Created on    : 15-Oct-2025                               
#                    Purpose       : Monitor disk usage and send email alerts  
#                                    if disk usage exceeds a defined threshold.
###############################################################################

#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Usage: $0 <threshold_percentage> <email_address>"
   
fi

THRESHOLD=$1
EMAIL=$2

USAGE=$(df -h / | awk 'NR==2 {print $5}' | sed 's/%//')

if [ "$USAGE" -ge "$THRESHOLD" ]; then
    echo "Disk usage is high: ${USAGE}% on $(hostname)" | mail -s "Disk Alert: $(hostname)" "$EMAIL"
    echo "Alert sent! Disk usage is ${USAGE}% (Threshold: ${THRESHOLD}%)."
else
    echo "Disk usage is normal (${USAGE}%)."
fi
