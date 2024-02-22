#!/bin/bash

# make Go garbage collector very aggresive in order to try to prevent out of memory issues
export GOGC=20

## run unlock script first (includes setting env vars)
. /home/joseph/Documents/Backup/Restic/restic-scripts/restic_env.sh


echo "-"
echo "-"
echo "Checking backup ($(date))..."
echo "---------------------------"

#restic check --cache-dir "${RESTIC_CACHE_DIR}" --cleanup-cache
/usr/local/bin/restic check --read-data --cache-dir $RESTIC_CACHE_DIR --cleanup-cache

echo ""
echo "Finished checking backup $(date)"
echo "---------------------------"
