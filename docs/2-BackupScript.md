# Backup Script
Copy to LocalPath: `~/BackupTool/scripts/com.hostname.backup.sh`

This backup script declares the connections to use with RClone 
(defined in previous step) and the source and destination paths.

** Insure all directories and paths exist before running.  This script 
does not create directories it only reads/writes to what's configured.

This script is designed to sync directories from separate connections 
(Droplet and CDN). The `SNAPSHOTS` and `CDN` connections are separate jobs. You 
can simply delete either set of variables to limit the script to one task.

```
#!/usr/bin/env bash
source ~/BackupTool/backup.sh

# Notification Title / Logfile Name
NOTIFICATION_TITLE="CloudBackup"

# Logger (uncomment to override)
#TIMESTAMP=`date +"%Y-%m-%d@%I:%M%p"`
#LOG_DIRECTORY=~/BackupTool/logs
#LOG_MAX=8

# Database Snapshot Dumps (primary task)
SNAPSHOTS_CONNECTION=mysetting-droplet
SNAPSHOTS_SOURCE=/home/forge/snapshots
SNAPSHOTS_DESTINATION=~/Backups/mysetting/snapshots

# CDN Storage (secondary task: uncomment if needed)
# CDN_CONNECTION=mysetting-spaces
# CDN_BUCKET=my-bucket
# CDN_DESTINATION=~/Backups/mysetting/spaces

# Create Log File & Notify
startBackup

# Handle Remote Dumps
logger "Dumping Remote Databases..."
ssh forge@hostname "bash -s" < ~/BackupTool/utilities/dump-database.sh staging ${SNAPSHOTS_SOURCE}
ssh forge@hostname "bash -s" < ~/BackupTool/utilities/dump-database.sh production ${SNAPSHOTS_SOURCE}

# Run Backup
runBackup
```

