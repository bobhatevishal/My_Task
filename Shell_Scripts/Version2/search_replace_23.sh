# =============================================================================>
#                    Script Name   : search_replace.sh                             >
#                    Version       : 1.1                                           >
#                    Author        : Vishal Bobhate                                >
#                    Created on    : 22-Oct-2025                                   >
#                    Purpose       : Search and replace text in files              >
###############################################################################>

#!/bin/bash

DIR="$1"
SEARCH="$2"
REPLACE="$3"

if [ $# -ne 3 ]; then
    echo "Usage: $0 <directory_path> <search_text> <replacement_text>"
fi

if [ ! -d "$DIR" ]; then
    echo "Error: Directory '$DIR' not found."
fi

for FILE in "$DIR"/*; do
    [[ -f "$FILE" ]] || continue
    sed -i "s/$SEARCH/$REPLACE/g" "$FILE"
    echo "Updated: $FILE"
done

echo "Search and replace completed successfully in '$DIR'."
