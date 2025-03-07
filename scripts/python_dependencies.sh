#!/usr/bin/env bash

set -e  # Exit script if any command fails

# Change ownership
sudo chown -R ubuntu:ubuntu ~/Project_folder_name

# Create virtual environment
virtualenv /home/ubuntu/Project_folder_name/venv

# Activate virtual environment
source /home/ubuntu/Project_folder_name/venv/bin/activate

# Use the correct path for requirements.txt
REQ_FILE="/home/ubuntu/blogprojectdrf/requirements.txt"

if [ -f "$REQ_FILE" ]; then
    pip install -r "$REQ_FILE"
else
    echo "Error: $REQ_FILE not found!"
    exit 1
fi
