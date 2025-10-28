# =============================================================================
#                    Script Name   : compare_dirs.sh                            
#                    Version       : 2.0                                        
#                    Author        : Vishal Bobhate                             
#                    Created on    : 22-Oct-2025                                
#                    Purpose       : Compare two directories and report differences
###############################################################################

#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Usage: $0 <directory1> <directory2>"
fi

DIR1=$1
DIR2=$2

if [ ! -d "$DIR1" ] || [ ! -d "$DIR2" ]; then
    echo "Error: One or both directories do not exist."
fi

if diff -qr "$DIR1" "$DIR2" > /dev/null; then
    echo "No differences found between '$DIR1' and '$DIR2'."
else
    echo "Differences exist between the directories:"
    diff -qr "$DIR1" "$DIR2"
fi
