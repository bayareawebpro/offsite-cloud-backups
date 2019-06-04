# Backup Script
LocalPath: `~/BackupTool/scripts/com.hostname.backup.sh`

The backup script declares the connections and paths to use with RClone defined in the previous step.

```
#!/usr/bin/env bash
source ~/BackupTool/backup.sh

# Database Snapshot Dumps
SNAPSHOTS_SOURCE=/home/forge/snapshots
SNAPSHOTS_CONNECTION=mysetting-droplet
SNAPSHOTS_DESTINATION=~/Backups/mysetting/snapshots

# CDN Storage
CDN_BUCKET=my-bucket
CDN_CONNECTION=mysetting-spaces
CDN_DESTINATION=~/Backups/mysetting/spaces

# Create Log File & Notify
startBackup

# Handle Remote Dumps
logger "Dumping Remote Databases..."
ssh forge@hostname "bash -s" < ~/BackupTool/utilities/dump-database.sh staging
ssh forge@hostname "bash -s" < ~/BackupTool/utilities/dump-database.sh production

# Run Backup
runBackup
```

