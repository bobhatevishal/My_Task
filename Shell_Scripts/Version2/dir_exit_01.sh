# =============================================================================
#                    Script Name   : list_dir_files.sh                          
#                    Version       : 2.0                                        
#                    Author        : Vishal Bobhate                              
#                    Created on    : 22-Oct-2025                                
#                    Purpose       : List all files in a specified directory    
#                                    and save the output to a text file.        
###############################################################################

#!/bin/bash


if [ $# -ne 1 ]; then
    echo "Usage: $0 <directory_path>"
fi

path=$1
output_file="output.txt"

if [ ! -d "$path" ]; then
    echo "Error: Directory '$path' does not exist."
    exit 1
fi

ls "$path" > "$output_file" 2>/dev/null

if [ $? -eq 0 ]; then
    echo "File list from '$path' saved to '$output_file'."
else
    echo "Failed to list files from '$path'."
   
fi
