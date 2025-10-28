#!/bin/bash
# =============================================================================
# Script Name   : list_dir_files.sh
# Version       : 2.0
# Author        : Vishal Bobhate
# Created on    : 22-Oct-2025
# Purpose       : List all files in a specified directory
#                 and save the output to a text file.
# =============================================================================

path=$1
output_file="output.txt"

if [ $# -ne 1 ]; then
    echo "Usage: $0 <directory_path>"
    exit 1

elif [ ! -d "$path" ]; then
    echo "Error: Directory '$path' does not exist."
    exit 1

else
    echo "Failed to list files from '$path'."
    exit 1
fi
