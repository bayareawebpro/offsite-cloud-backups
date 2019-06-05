# Backup Script
Copy to LocalPath: `~/BackupTool/scripts/com.hostname.backup.sh`

This backup script declares the connections to use with RClone 
(defined in previous step) and the source and destination paths.

** Insure all directories and paths exist before running.  This script 
does not create directories it only reads/writes to what's configured.

```
#!/usr/bin/env bash
source ~/BackupTool/backup.sh

# Database Snapshot Dumps
SNAPSHOTS_CONNECTION=mysetting-droplet
SNAPSHOTS_SOURCE=/home/forge/snapshots
SNAPSHOTS_DESTINATION=~/Backups/mysetting/snapshots

# CDN Storage
CDN_CONNECTION=mysetting-spaces
CDN_BUCKET=my-bucket
CDN_DESTINATION=~/Backups/mysetting/spaces

# Create Log File & Notify
startBackup

# Handle Remote Dumps
logger "Dumping Remote Databases..."
ssh forge@hostname "bash -s" < ~/BackupTool/utilities/dump-database.sh staging ${SNAPSHOTS_SOURCE}
ssh forge@hostname "bash -s" < ~/BackupTool/utilities/dump-database.sh production ${SNAPSHOTS_SOURCE}

# Run Backup
runBackup
```

