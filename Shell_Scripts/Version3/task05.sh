# =============================================================================
#                    Script Name   : software_update.sh                        
#                    Version       : 2.1                                        
#                    Author        : Vishal Bobhate                             
#                    Created on    : 22-Oct-2025                                
#                    Updated on    : 27-Oct-2025                                
#                    Purpose       : Check for software updates and install     
#                                    them automatically using yum.              
###############################################################################

#!/bin/bash
software=$1

if [ -z "$software" ]; then
    read -p "Enter the software name to update: " software

elif ! command -v yum &> /dev/null; then
    echo "'yum' command not found. Please ensure this script is run on an RPM-based system."
    exit 1
else
    if yum update "$software" -y; then
        echo "'$software' updated successfully."
    else
        echo "Failed to update '$software'."
    fi
fi
