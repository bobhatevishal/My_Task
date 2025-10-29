#   Write a script that calculates the total disk space used by a specified user and outputs the result.
#!/bin/bash
read -p "enter the name of user : " username
TOTAL_USAGE=$(find/ -user "$username" -type f -exec du -b {} + 2>/dev/null | awk '{sum += $1 })END {print sum }')
HUMAN_READABLE=$(numfmt --to=iec --suffix=B "$TOTAL_Usage")
echo " total  disk space use by user"
'$USERNAME:$HUMAN_READABLE'