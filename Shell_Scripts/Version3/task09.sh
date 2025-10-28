# =============================================================================
# Script Name   : delete_files.sh
# Version       : 2.1
# Author        : Vishal Bobhate
# Created on    : 22-Oct-2025
# Updated on    : 28-Oct-2025
# Purpose       : Delete files in a directory matching a specified pattern.
# =============================================================================

#!/bin/bash

dir_path=$1
file_pattern=$2

if [ $# -ne 2 ]; then
    echo "Usage: $0 <directory_path> <file_pattern>"

elif [ ! -d "$dir_path" ]; then
    echo "Error: Directory '$dir_path' does not exist."

elif find "$dir_path" -type f -name "$file_pattern" -delete; then
    echo "Files matching '$file_pattern' deleted successfully from '$dir_path'."

else
    echo "Failed to delete files from '$dir_path'."
fi
