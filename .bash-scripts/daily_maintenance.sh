#!/bin/bash

# Ensure the script is run as root
if [ "$EUID" -ne 0 ]; then
  echo "Please run this script as root or with sudo."
  exit 1
fi

# Ubuntu Linux Daily Maintenance Script
echo "Starting daily system maintenance..."

# Update package list and upgrade installed packages
echo "Updating system packages..."
apt update -y && apt upgrade -y

# Clean up unused packages and dependencies
echo "Removing unused packages and dependencies..."
apt autoremove -y
apt autoclean -y

# Clean system cache
echo "Cleaning APT cache..."
rm -rf /var/cache/apt/archives/*

# Check and clean old log files
echo "Cleaning old log files..."
find /var/log -type f -name "*.log" -exec truncate -s 0 {} \;

# Check disk space usage
echo "Checking disk usage..."
df -h

# Update snap packages (if applicable)
echo "Updating snap packages..."
snap refresh

# Restart services if necessary
echo "Checking for services that need restarting..."
if [ -x "$(command -v needrestart)" ]; then
    # Run needrestart and display its output
    needrestart
    # Check the exit status of needrestart to provide more feedback
    if [ $? -eq 0 ]; then
        echo "No services need restarting."
    else
        echo "Some services need restarting. Please review the output above."
    fi
else
    echo "'needrestart' is not installed. Install it for better control over service restarts."
    echo "You can install it with the following command: sudo apt install needrestart"
fi

# Display system uptime
echo "System uptime:"
uptime

echo "Daily maintenance completed!"
