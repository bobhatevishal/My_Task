#!/bin/bash
MY_REPORT=$(find /home -maxdepth 1 -mindepth 1 -type d -mtime -1)
if [-n "$MY_REPORT"]; then
    echo -e "new user created in last 24 hours:\n$MY_REPORT"
else
   echo "no new user created in past 24 hr"
fi