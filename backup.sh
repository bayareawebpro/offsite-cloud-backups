#!/usr/bin/env bash
export PATH=/usr/local/bin:$PATH

# Notification Title / Logfile Name
#NAME="DigitalOcean";

# Databases
#SNAPSHOTS_SOURCE=/home/forge/snapshots
#SNAPSHOTS_CONNECTION=hostname-droplet
#SNAPSHOTS_DESTINATION=~/Backups/hostname/snapshots

# CDN Storage
#CDN_BUCKET=my-bucket
#CDN_CONNECTION=hostname-spaces
#CDN_DESTINATION=~/Backups/hostname/spaces

# Logging
TIMESTAMP=`date +"%Y-%m-%d@%I:%M%p"`
LOG_DIRECTORY=~/BackupTool/logs
LOG_MAX=8

# Write Log File & Notify User.
function startBackup(){
    if [[ -z $NAME ]]; then
        NAME="CloudBackup"
    fi

    LOG="$LOG_DIRECTORY/$NAME-$TIMESTAMP.log"

    osascript -e 'display notification "Cloud Backup Started." with title "'${NAME}'"'
    logger "===$NAME $TIMESTAMP==="
}

# Write Line to Log File.
function logger(){
    if [[ ! -f "$LOG" ]]; then
       touch ${LOG}
    fi
    echo $1 >> ${LOG}
}

# Run Cloud Synchronization
function runBackup(){
    # Synchronize Database Snapshots.
    if [[ -z $SNAPSHOTS_SOURCE || -z $SNAPSHOTS_CONNECTION || -z $SNAPSHOTS_DESTINATION ]]; then
        logger "SNAPSHOT Variables are not Configured."
    else
        logger "Synchronizing Database Snapshots..."
        rclone sync ${SNAPSHOTS_CONNECTION}:${SNAPSHOTS_SOURCE} ${SNAPSHOTS_DESTINATION} >> ${LOG} 2>&1
    fi

    # Synchronize CDN Files.
    if [[ -z $CDN_BUCKET || -z $CDN_CONNECTION || -z $CDN_DESTINATION ]]; then
        logger "CDN Variables are not Configured."
    else
        logger "Synchronizing CDN Storage..."
        rclone sync --ignore-existing --cache-rps 180 ${CDN_CONNECTION}:${CDN_BUCKET} ${CDN_DESTINATION} >> ${LOG} 2>&1
    fi

    # Add to Notifications Center.
    logger "Backup Completed Successfully."
    osascript -e 'display notification "Cloud Backup Completed Successfully." with title "'${NAME}'"'

    # Trim old log files.
    if [[ -d ${LOG_DIRECTORY} ]]; then
        cd ${LOG_DIRECTORY} && rm -f `ls -t | awk 'NR>'"$LOG_MAX"''`
        logger "Old Log Files Trimmed."
    fi

    # Open the log file in Console.app
    open -a Console ${LOG}

    # Finish Successfully.
    exit 0
}
