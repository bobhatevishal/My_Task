# =============================================================================
#                    Script Name   : add_users_from_csv.sh                      
#                    Version       : 2.0                                        
#                    Author        : Vishal Bobhate                             
#                    Created on    : 22-Oct-2025                                
#                    Purpose       : Add new users from a CSV file (username,id)
###############################################################################

#!/bin/bash
if [ $# -ne 1 ]; then
    echo "Usage: $0 <csv_file_path>"
    exit 1
fi

file=$1

if [ ! -f "$file" ]; then
    echo "Error: File '$file' does not exist."
    exit 1
fi

while IFS=',' read -r username id; do
    if [ -n "$username" ]; then
        useradd "$username" && echo "User '$username' added successfully." || echo "Failed to add user '$username'."
    fi
done < "$file"
