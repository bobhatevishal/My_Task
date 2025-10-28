# =============================================================================
#                    Script Name   : website_monitor.sh                        
#                    Version       : 2.1                                        
#                    Author        : Vishal Bobhate                             
#                    Created on    : 22-Oct-2025                                
#                    Updated on    : 28-Oct-2025                                
#                    Purpose       : Monitor a website and report if it is down 
###############################################################################

#!/bin/bash

check_website() {
    status=$(curl -Is "$website" 2>/dev/null | head -n1 | awk '{print $2}')
    
    if [ -z "$status" ]; then
        echo "Error: Unable to reach $website"
    elif [ "$status" != "200" ]; then
        echo "$website is DOWN"
    else
        echo "$website is UP"
    fi
}

website=$1

if [ -z "$website" ]; then
    read -p "Enter website URL to monitor: " website
fi

if [ -z "$website" ]; then
    echo "Error: No website provided."
else
    check_website
fi
