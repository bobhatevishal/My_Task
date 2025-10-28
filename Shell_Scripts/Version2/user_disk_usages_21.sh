# =============================================================================>
#                    Script Name   : user_disk_usage.sh                           >
#                    Version       : 2.0                                          >
#                    Author        : Vishal Bobhate                               >
#                    Created on    : 22-Oct-2025                                  >
#                    Updated on    : 27-Oct-2025                                  >
#                    Purpose       : Calculate total disk space used by a user    >
###############################################################################>

#!/bin/bash
USERNAME=$1

if [ -z "$USERNAME" ]; then
    read -p "Enter username: " USERNAME
fi

if [ -z "$USERNAME" ]; then
    echo " Error: No username provided."
fi

if ! id "$USERNAME" &>/dev/null; then
    echo " Error: User '$USERNAME' does not exist on this system."
fi

TOTAL_USAGE=$(find / -user "$USERNAME" -type f -exec du -b {} + 2>/dev/null | awk '{sum+=$1} END{print sum}')
HUMAN_READABLE=$(numfmt --to=iec --suffix=B "$TOTAL_USAGE")

echo "Total disk space used by '$USERNAME': $HUMAN_READABLE"
