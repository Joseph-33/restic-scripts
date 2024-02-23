#!/bin/bash

# restic variables
export RESTIC_ADDRESS=10.140.119.141
export RESTIC_REST_USERNAME=
export RESTIC_REST_PASSWORD=
export RESTIC_PASSWORD=
export RESTIC_CACERT=/home/joseph/Documents/Backup/Restic/public_key
#export RESTIC_INCLUDE_PATHS="/home/joseph/Backups/Law_Lu_3levels/Law_Lu_3levels"
#export RESTIC_EXCLUDE_FILE_PATH="/home/user/restic/excludelist.txt"
#export RESTIC_CACHE_DIR="/home/joseph/Documents/Backup/Restic/cache"
export RESTIC_REPOSITORY="rest:https://$RESTIC_REST_USERNAME:$RESTIC_REST_PASSWORD@$RESTIC_ADDRESS:8000/$RESTIC_REST_USERNAME"

#rsync -av --del -e ssh draco:/home/je79tak/documents/grasp_projects/Law_Lu_3levels /home/joseph/Backups/Law_Lu_3levels |& tee out.out


#restic -r rest:https://$RESTIC_NAME:$RESTIC_HTPASSWORD@$RESTIC_ADDRESS:8000/$RESTIC_NAME --cacert=$RESTIC_CERT diff 0d7fd6c9 1a41a038

