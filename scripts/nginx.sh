#!/usr/bin/bash

set -e  # Exit immediately if any command fails

PROJECT_NAME="blogprojectdrf"  # Update this if needed
NGINX_CONF_PATH="/home/ubuntu/${PROJECT_NAME}/nginx/nginx.conf"
NGINX_AVAILABLE="/etc/nginx/sites-available/${PROJECT_NAME}"
NGINX_ENABLED="/etc/nginx/sites-enabled/${PROJECT_NAME}"

sudo systemctl daemon-reload
sudo rm -f /etc/nginx/sites-enabled/default

# Ensure the nginx.conf file exists before copying
if [ -f "$NGINX_CONF_PATH" ]; then
    sudo cp "$NGINX_CONF_PATH" "$NGINX_AVAILABLE"
    sudo ln -sf "$NGINX_AVAILABLE" "$NGINX_ENABLED"
else
    echo "Error: Nginx configuration file not found at $NGINX_CONF_PATH"
    exit 1
fi

# Add www-data user to ubuntu group
sudo gpasswd -a www-data ubuntu

# Test and restart Nginx
if sudo nginx -t; then
    sudo systemctl restart nginx
    echo "Nginx restarted successfully."
else
    echo "Nginx configuration test failed. Check the config file."
    exit 1
fi
