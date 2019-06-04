# LaunchAgent Installer Script:
Usage: 

```
~/BackupTool/install-launchagent.sh ~/BackupTool/com.digitalocean.backup.xml
```

## Create a Launch Agent Source File (XML Below)
LocalPath: `~/BackupTool/scripts/com.digitalocean.backup.xml`

The "Label" key needs to match the filename.
**Customize the paths** in the provided template:
```
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple Computer//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
    <dict>
        <key>Label</key>
        <string>com.digitalocean.backup</string>
        <key>Program</key>
        <string>/Users/ME/BackupTool/com.digitalocean.backup.sh</string>
        <key>RunAtLoad</key>
        <true/>
        <key>StartCalendarInterval</key>
        <array>
            <dict>
                <key>Hour</key>
                <integer>0</integer>
                <key>Minute</key>
                <integer>0</integer>
            </dict>
            <dict>
                <key>Hour</key>
                <integer>3</integer>
                <key>Minute</key>
                <integer>0</integer>
            </dict>
            <dict>
                <key>Hour</key>
                <integer>6</integer>
                <key>Minute</key>
                <integer>0</integer>
            </dict>
            <dict>
                <key>Hour</key>
                <integer>9</integer>
                <key>Minute</key>
                <integer>0</integer>
            </dict>
            <dict>
                <key>Hour</key>
                <integer>12</integer>
                <key>Minute</key>
                <integer>0</integer>
            </dict>
            <dict>
                <key>Hour</key>
                <integer>15</integer>
                <key>Minute</key>
                <integer>0</integer>
            </dict>
            <dict>
                <key>Hour</key>
                <integer>18</integer>
                <key>Minute</key>
                <integer>0</integer>
            </dict>
            <dict>
                <key>Hour</key>
                <integer>21</integer>
                <key>Minute</key>
                <integer>0</integer>
            </dict>
        </array>
    </dict>
</plist>

```