#Write a script that periodically syncs a local directory with a remote server using 'rsync' and 'cron
read -p "Enter the local Dir : "  LOCAL_DIR
read -p "Enter the remote user: " REMOTE_USER 
read -p "Enter the remote server IP or hostname: " REMOTE_HOST
read -p "Enter the remote directory to back up to: " REMOTE_DIR
rsync -avzh --delete $SOURCE_DIR $REMOTE_USER@$REMOTE_HOST : $REMOTE_DIR
