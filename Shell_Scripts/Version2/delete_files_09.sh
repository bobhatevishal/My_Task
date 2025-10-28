# =============================================================================
#                    Script Name   : delete_files.sh                            
#                    Version       : 2.0                                        
#                    Author        : Vishal Bobhate                             
#                    Created on    : 22-Oct-2025                                
#                    Purpose       : Delete files in a directory matching a     
#                                    specified pattern.                         
###############################################################################

#!/bin/bash


if [ $# -ne 2 ]; then
    echo "Usage: $0 <directory_path> <file_pattern>"
fi

dir_path=$1
file_pattern=$2

if [ ! -d "$dir_path" ]; then
    echo "Error: Directory '$dir_path' does not exist."
  
fi

if find "$dir_path" -type f -name "$file_pattern" -delete; then
    echo "Files matching '$file_pattern' deleted successfully from '$dir_path'."
else
    echo "Failed to delete files from '$dir_path'."
fi
