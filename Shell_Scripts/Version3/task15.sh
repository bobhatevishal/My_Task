#                    Script Name   : find_old_files.sh                          >
#                    Version       : 1.1                                        >
#                    Author        : Vishal Bobhate                             >
#                    Created on    : 22-Oct-2025                                >
#                    Purpose       : List files not accessed in X days          >
###############################################################################>

#!/bin/bash

dir="$1"
days="$2"

if [ -z "$dir" ]; then
    read -p "Enter directory: " dir
fi

if [ -z "$days" ]; then
    read -p "Enter number of days: " days
fi

if [ ! -d "$dir" ]; then
    echo "Error: Directory '$dir' does not exist."
    exit 1
fi

echo "Files in '$dir' not accessed in last $days days:"
find "$dir" -type f -atime +"$days"
