# =============================================================================
# Script Name   : rsync_backup.sh
# Version       : 1.2
# Author        : Vishal Bobhate
# Purpose       : Sync a local directory to a remote server
# =============================================================================

#!/bin/bash

LOCAL_DIR="$1"
REMOTE_USER="$2"
REMOTE_HOST="$3"
REMOTE_DIR="$4"

if [ $# -ne 4 ]; then
    echo "Usage: $0 <local_directory> <remote_user> <remote_host> <remote_directory>"

elif [ ! -d "$LOCAL_DIR" ]; then
    echo "Error: Local directory '$LOCAL_DIR' does not exist."

elif rsync -avzh --delete "$LOCAL_DIR/" "$REMOTE_USER@$REMOTE_HOST:$REMOTE_DIR"; then
    echo "Backup of '$LOCAL_DIR' to '$REMOTE_USER@$REMOTE_HOST:$REMOTE_DIR' completed successfully."

else
    echo "Backup failed! Please verify connection and directory paths."
fi
