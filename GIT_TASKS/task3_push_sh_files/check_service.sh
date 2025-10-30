#!/bin/bash
# =============================================================================
#                  Script Name : task3_service.sh                              
#                  Version     : 2.0                                          
#                  Author      : Vishal Bobhate                                
#                  Created on  : 15-Oct-2025                                   
#                  Purpose     : Checks whether a given service is running.    
#                                 If not, restarts the service.                
###############################################################################

if [ $# -ne 1 ]; then
    echo "Usage: $0 <service_name>"
fi

service_name=$1

service "$service_name" status > /dev/null 2>&1

if [ $? -ne 0 ]; then
    echo "Service '$service_name' is not running. Attempting to restart..."
    service "$service_name" restart

    if [ $? -eq 0 ]; then
        echo "Service '$service_name' restarted successfully."
    else
        echo "Failed to restart service '$service_name'. Please check manually."
    fi
else
    echo "Service '$service_name' is running."
fi
