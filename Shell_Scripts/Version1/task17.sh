# Write a script that checks for and reports any failed SSH login attempts on a Linux server.
#!/bin/bash
cat /var/log/secure | grep failed > ssh_failed_data
echo "data stored"
