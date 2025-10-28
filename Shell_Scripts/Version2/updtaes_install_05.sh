# =============================================================================>
#                    Script Name   : software_update.sh                        >
#                    Version       : 2.0                                        >
#                    Author        : Vishal Bobhate                             >
#                    Created on    : 22-Oct-2025                                >
#                    Updated on    : 27-Oct-2025                                >
#                    Purpose       : Check for software updates and install     >
#                                    them automatically using yum.              >
###############################################################################>

#!/bin/bash
software=$1

if [ -z "$software" ]; then
    read -p "Enter the software name to update: " software
fi

if ! command -v yum &> /dev/null; then
    echo "'yum' command not found. Please ensure this script is run on an RPM-based system."

fi

if yum update "$software" -y; then
    echo "'$software' updated successfully."
else
    echo "Failed to update '$software'."
fi

