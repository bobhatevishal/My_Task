# =============================================================================
#                    Script Name   : organize_files.sh                           
#                    Version       : 1.2                                        
#                    Author        : Vishal Bobhate                             
#                    Created on    : 22-Oct-2025                                                             
#                    Purpose       : Organize files by type in a directory       
# =============================================================================

#!/bin/bash

DIR="$1"

if [ -z "$DIR" ]; then
    echo "Usage: $0 <directory_path>"

elif [ ! -d "$DIR" ]; then
    echo "Error: Directory '$DIR' does not exist."

else
    cd "$DIR" || exit 1

    mkdir -p images documents audio others

    for FILE in *; do
        [[ -f "$FILE" ]] || continue
        case "${FILE,,}" in
            *.jpg|*.jpeg|*.png|*.gif) mv "$FILE" images/ ;;
            *.pdf|*.txt|*.doc|*.docx) mv "$FILE" documents/ ;;
            *.mp3|*.wav|*.m4a) mv "$FILE" audio/ ;;
            *) mv "$FILE" others/ ;;
        esac
    done

    echo "Files organized successfully in '$DIR'."
fi
