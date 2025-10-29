#Write a shell script that checks for software updates and installs them automatically.
#!/bin/bash
read -p "Enter your package manager : " software
systemctl $sof update -y
echo "system update successfully"