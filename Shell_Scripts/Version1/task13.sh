#!/bin/bash
[ "$EUID" != 0 ] && echo "run as root " && exit 1
read -p "Domain name :--  " DOMAIN
dir="/var/www/$DOMAIN"
CONF="/etc/httpd/conf.d/$DOMAIN.conf"
mkdir -p "dir"
echo "$DOMAIN is live " > "$dir/index.html"

cat > "$CONF" <<EOF
<VirtualHost *:80>
 ServerName $DOMAIN
 DocumentRoot $dir
</VirtualHost>
EOF