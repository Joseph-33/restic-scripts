#!/bin/bash

# run unlock script first (includes setting env vars)
. /home/joseph/Documents/Backup/Restic/restic-scripts/restic_env.sh

RESTIC_INCLUDE_PATHS="/home/joseph/Backups/Law_Lu_3levels/Law_Lu_3levels /home/joseph/Nextcloud2/"

echo "-"
echo "-"
echo "Running scheduled backup ($(date))..."
echo "---------------------------"

/usr/bin/rsync -av --del -e "ssh -i /home/joseph/.ssh/draco_password" draco:/home/je79tak/documents/grasp_projects/Law_Lu_3levels /home/joseph/Backups/Law_Lu_3levels
/usr/local/bin/restic backup $RESTIC_INCLUDE_PATHS

echo ""
echo "Finished scheduled backup $(date)"
echo "---------------------------"
