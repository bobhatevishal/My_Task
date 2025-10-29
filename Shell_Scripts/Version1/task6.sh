#Write a script that compresses and archives log files older than a certain number of days.
#!/bin/bash
find /var/log -type f -name "*.log" -mtime +7 -exec gzip {} \;
echo "Log files older than 7 days have been compressed."  
