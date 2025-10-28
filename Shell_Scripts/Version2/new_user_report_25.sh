# =============================================================================>
#                    Script Name   : new_user_report.sh                           >
#                    Version       : 1.1                                           >
#                    Author        : Vishal Bobhate                                >
#                    Created on    : 22-Oct-2025                                   >
#                    Purpose       : List users created in last X hours           >
###############################################################################>

#!/bin/bash

DIR_PATH="${1:-/home}"
HOURS="${2:-24}"

MY_REPORT=$(find "$DIR_PATH" -maxdepth 1 -mindepth 1 -type d -mtime -$((HOURS/24)))

if [ -n "$MY_REPORT" ]; then
    echo -e " New users created in last $HOURS hours in '$DIR_PATH':\n$MY_REPORT"
else
    echo " No new users created in the past $HOURS hours in '$DIR_PATH'."
fi
