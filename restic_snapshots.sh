#!/bin/bash

# run unlock script first (includes setting env vars)
. /home/joseph/Documents/Backup/Restic/restic-scripts/restic_env.sh

restic snapshots
