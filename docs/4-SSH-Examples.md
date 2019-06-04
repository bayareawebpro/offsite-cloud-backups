# SSH Examples

A few SSH examples for working with a remote database and directory:

#### SqlDump Remote Instance to LocalHost Instance (sync)
```
ssh -C forge@hostname "mysqldump production" | mysql production
```

#### SqlDump Remote Instance to Local Disk (compressed)
```
ssh forge@hostname "mysqldump production | gzip -9" > ~/Desktop/production.sql.gz
```

#### SCP Remote Directory to Local Disk
```
scp -r forge@hostname:/home/forge/my-directory ~/Desktop/my-directory
```

#### Execute Local Script on Remote Host
```
ssh forge@hostname "bash -s" < scripts/script.sh
```
