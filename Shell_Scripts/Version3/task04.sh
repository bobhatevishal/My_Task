# =============================================================================
#                    Script Name   : backup_rsync.sh                            
#                    Version       : 2.1                                        
#                    Author        : Vishal Bobhate                             
#                    Created on    : 22-Oct-2025                                
#                    Purpose       : Backup a specified directory to a remote   
#                                    server using rsync over SSH.               
###############################################################################

#!/bin/bash
SOURCE_DIR=$1
REMOTE_USER=$2
REMOTE_HOST=$3
REMOTE_DIR=$4

if [ $# -ne 4 ]; then
    echo "Usage: $0 <source_dir> <remote_user> <remote_host> <remote_dir>"

elif [ ! -d "$SOURCE_DIR" ]; then
    echo "Error: Source directory '$SOURCE_DIR' does not exist."

else
    rsync -avz -e ssh "$SOURCE_DIR" "$REMOTE_USER@$REMOTE_HOST:$REMOTE_DIR"
    
    if [ $? -eq 0 ]; then
        echo "Backup of '$SOURCE_DIR' to '$REMOTE_USER@$REMOTE_HOST:$REMOTE_DIR' completed successfully."
        echo "$(date): Backup of $SOURCE_DIR to $REMOTE_USER@$REMOTE_HOST:$REMOTE_DIR completed." >> backup.log
    else
        echo "Backup failed! Please check the directory paths or SSH connection."
    fi
fi
