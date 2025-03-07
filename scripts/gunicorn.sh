#!/usr/bin/bash

GUNICORN_SERVICE="/home/ubuntu/blogprojectdrf/gunicorn/gunicorn.service"
GUNICORN_SOCKET="/home/ubuntu/blogprojectdrf/gunicorn/gunicorn.socket"

# Ensure required files exist before starting service
if [ ! -f "$GUNICORN_SOCKET" ] || [ ! -f "$GUNICORN_SERVICE" ]; then
    echo "Error: Required Gunicorn files are missing in /home/ubuntu/blogprojectdrf/gunicorn"
    exit 1
fi

# Reload systemd daemon to recognize services
sudo systemctl daemon-reload

# Enable and start Gunicorn service
sudo systemctl enable "$GUNICORN_SERVICE"
sudo systemctl start "$GUNICORN_SERVICE"

echo "Gunicorn service started successfully."
