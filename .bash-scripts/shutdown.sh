#!/bin/bash
# Graceful Shutdown Script for a Longer-Lived Linux PC
# This script syncs files, notifies users, and schedules a shutdown.

# Ensure the script is executed with root privileges.
if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root. Please use sudo."
  exit 1
fi

# Prompt for confirmation (unless passed the --force argument)
if [[ "$1" != "--force" ]]; then
  read -p "Are you sure you want to gracefully shutdown the system? (y/n): " confirm
  if [[ "$confirm" != "y" && "$confirm" != "Y" ]]; then
    echo "Shutdown cancelled."
    exit 0
  fi
fi

# Log the shutdown process (optional)
echo "[$(date)] Initiating graceful shutdown..." >> /var/log/graceful_shutdown.log

# Sync file systems to flush disk caches and ensure data integrity.
echo "Syncing file systems..."
sync

# Optionally, you could add a short delay to allow the sync process to complete.
sleep 2

# Notify all logged-in users about the impending shutdown.
wall "Attention: System will gracefully shutdown in 1 minute. Please save your work!"

# Schedule the shutdown for 1 minute later.
shutdown -h +1 "System is shutting down gracefully. Please save all work."

echo "Shutdown command issued. System will power off in 1 minute."
