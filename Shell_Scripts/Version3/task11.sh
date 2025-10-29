# =============================================================================
# Script Name   : add_users_from_csv.sh
# Version       : 2.1
# Author        : Vishal Bobhate
# Created on    : 22-Oct-2025
# Purpose       : Add new users from a CSV file (username,id)
# =============================================================================

#!/bin/bash

if [ $# -ne 1 ] && [ ! -f "$1" ]; then
    echo "Usage: $0 <csv_file_path>"
    [ ! -f "$1" ] && echo "Error: File '$1' does not exist."
    exit 1

else
    file=$1
    while IFS=',' read -r username id; do
        if [ -n "$username" ]; then
            useradd "$username" && echo "User '$username' added successfully." || echo "Failed to add user '$username'."
        fi
    done < "$file"
fi
