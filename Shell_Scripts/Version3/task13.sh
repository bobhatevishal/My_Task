###################################################################################
#     Script Name   :  create_vhost.sh                                            #
#     Version       :  2.0                                                        #
#     Author        :  Vishal Bobhate                                              #
#     Date          :  22-Oct-2025                                                #
#     Credit        :  Team CloudEthix                                            #
#     Purpose       :  Create an Apache virtual host for a domain and reload Apache #
###################################################################################

#!/bin/bash

create_vhost() {
    if [ "$EUID" -ne 0 ]; then
        echo "Error: Please run this script as root."
        exit 1

    elif ["$1" ]; then
        echo "Usage: $0 <domain_name>"
        echo "Example: $0 example.com"
        exit 1

    else
        DOMAIN=$1
        DIR="/var/www/$DOMAIN"
        CONF="/etc/httpd/conf.d/$DOMAIN.conf"

        mkdir -p "$DIR" && echo "$DOMAIN is live!" > "$DIR/index.html"

        if cat > "$CONF" <<EOF
<VirtualHost *:80>
    ServerName $DOMAIN
    DocumentRoot $DIR
</VirtualHost>
EOF
        then
            if systemctl reload httpd; then
                echo " Virtual host for '$DOMAIN' created and Apache reloaded successfully!"
            else
                echo " Failed to reload Apache. Please check configuration."
            fi
        fi
}

create_vhost "$@"
