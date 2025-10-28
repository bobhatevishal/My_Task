# =============================================================================
#                    Script Name   : create_vhost.sh                           
#                    Version       : 1.0                                        
#                    Author        : Vishal Bobhate                             
#                    Created on    : 22-Oct-2025                                
#                    Purpose       : Create an Apache virtual host for a domain 
###############################################################################

#!/bin/bash

if [ "$EUID" -ne 0 ]; then
    echo " Error: Please run as root."
    exit 1
fi

DOMAIN=$1

if [ -z "$DOMAIN" ]; then
    read -p "Enter domain name: " DOMAIN
fi

if [ -z "$DOMAIN" ]; then
    echo " Error: No domain provided."
    exit 1
fi

dir="/var/www/$DOMAIN"
CONF="/etc/httpd/conf.d/$DOMAIN.conf"

mkdir -p "$dir" || { echo " Failed to create directory '$dir'"; exit 1; }

echo "$DOMAIN is live" > "$dir/index.html"

cat > "$CONF" <<EOF
<VirtualHost *:80>
    ServerName $DOMAIN
    DocumentRoot $dir
</VirtualHost>
EOF

echo " Virtual host for '$DOMAIN' created successfully."
