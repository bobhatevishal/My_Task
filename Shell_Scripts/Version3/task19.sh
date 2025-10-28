#!/bin/bash
# =============================================================================
# Script Name   : create_mysql_db.sh
# Version       : 2.1
# Author        : Vishal Bobhate
# Created on    : 22-Oct-2025
# Purpose       : Create MySQL database and user
# =============================================================================

ROOT_PASS=$1
DB_NAME=$2
DB_USER=$3
DB_PASS=$4

if [ $# -ne 4 ]; then
    echo "Usage: $0 <root_password> <database_name> <new_username> <new_user_password>"
elif ! systemctl is-active --quiet mysqld; then
    echo "Error: MySQL service is not running."
else
    mysql -u root -p"$ROOT_PASS" -e "
    CREATE DATABASE IF NOT EXISTS $DB_NAME;
    CREATE USER IF NOT EXISTS '$DB_USER'@'localhost' IDENTIFIED BY '$DB_PASS';
    GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'localhost';
    FLUSH PRIVILEGES;
    "

    if [ $? -eq 0 ]; then
        echo "Database '$DB_NAME' and user '$DB_USER' created successfully."
    else
        echo "Failed to create database or user. Please check credentials or MySQL service."
    fi
fi
