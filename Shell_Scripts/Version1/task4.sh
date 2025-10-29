#Write a script that backs up a specified directory to a remote server using 'rsync' and SSH.na
 read -p "Enter the directory to back up: " SOURCE_DIR
 read -p "Enter the remote user: " REMOTE_USER 
 read -p "Enter the remote server IP or hostname: " REMOTE_HOST
 read -p "Enter the remote directory to back up to: " REMOTE_DIR
 rsync -avz -e ssh "$SOURCE_DIR" "$REMOTE_USER@$REMOTE_HOST:$REMOTE_DIR"
#LOG_FILE=""
 echo "$(date): Backup of $SOURCE_DIR to $REMOTE_USER@$REMOTE_HOST:$REMOTE_DIR" 
 #>> "$LOG_FILE"  
if [ $? -eq 0 ]; then
     echo "Backup of $SOURCE_DIR to $REMOTE_USER@$REMOTE_HOST:$REMOTE_DIR completed successfully."
else
     echo "Backup failed!"
fi         