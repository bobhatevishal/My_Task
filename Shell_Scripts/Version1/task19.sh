# Write a script that automates the process of creating a new MySQL database, user, and granting privileges.
#!/bin/bash
read -p "Enter mysql root password :  "  R_pass
read -p " enter the database name :  " DB_name
read -p " enter the username : " DB_user
read -p "pass for new user : " DB_pass
echo mysql -u root -p "R_pass" -e " 
CREATE DATABASE '$(DB_user)' ;
CREATE USER '${DB_user}'@'localhost'
IDENTIFIED BY '${DB_pass}';
GRANT ALL PRIVILEGES ON ${DB_name}.* TO FLUSH PRIVILEGES;"

if [ $? = 0 ]; then 
     echo "Database ' ${DB_name}' and user '${DB_user}'create successfully."
else 
    echo "failed to create DB or user"
fi