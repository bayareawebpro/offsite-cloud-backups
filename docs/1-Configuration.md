# Setup

## 1. Server Access / SSH Keys
Create SSH Keys if you haven't already and setup a .my.conf for each environment's 
home directory (including local) so you can access mysql from the command line 
without a password.

## 2. MySql Commandline Access
Copy to ServerPath: `/home/forge/.my.conf`

```
[mysql]
user = forge
password = XXX

[mysqldump]
user = forge
password = XXX
```

## 3. RClone Cloud Storage Utility
Copy to LocalPath: `~/.config/rclone/rclone.conf`

Install RClone, and use the config generator, `rclone config` here's 
an example of what it outputs:

https://rclone.org

```
[mysetting-spaces]
type = s3
provider = DigitalOcean
env_auth = false
secret_access_key = XXX
endpoint = sfo2.digitaloceanspaces.com
location_constraint = 
acl = public-read
access_key_id = XXX

[mysetting-droplet]
type = sftp
host = 0.0.0.0
user = forge
key_file = ~/.ssh/id_rsa
```