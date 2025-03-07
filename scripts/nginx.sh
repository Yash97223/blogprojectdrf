#!/usr/bin/bash

sudo systemctl daemon-reload
sudo rm -f /etc/nginx/sites-enabled/default

# Define the correct folder where settings.py is located
PROJECT_NAME="blogprojectdrf"  # Update this if your project folder is different
NGINX_CONF_PATH="/home/ubuntu/${PROJECT_NAME}/nginx/nginx.conf"

# Ensure the file exists before copying
if [ -f "$NGINX_CONF_PATH" ]; then
    sudo cp "$NGINX_CONF_PATH" "/etc/nginx/sites-available/${PROJECT_NAME}"
    sudo ln -sf "/etc/nginx/sites-available/${PROJECT_NAME}" "/etc/nginx/sites-enabled/"
else
    echo "Error: Nginx configuration file not found at $NGINX_CONF_PATH"
    exit 1
fi

# Add www-data user to ubuntu group
sudo gpasswd -a www-data ubuntu

# Test Nginx configuration before restarting
sudo nginx -t && sudo systemctl restart nginx
