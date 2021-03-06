# LaunchAgent Installer Script:

Once you've configured and given your script a test run, you can then install it using the included LaunchAgent 
Installer Utility. Use the example below to create a new XML template. 

Upon installation the XML template will be copied to a `.plist` in the  `~/Library/LaunchAgents/` directory. If installed successfully 
the script will run as set by the `RunAtLoad` property.  This insures the script will run after installation or reboot 
in addition to the defined schedule. For help generating schedules, use the 
[launched.zerowidth.com](http://launched.zerowidth.com/) generator tool.

### Usage: 
```
~/BackupTool/utilities/install-launchagent.sh ~/BackupTool/scripts/com.digitalocean.backup.xml
```

### Launch Agent Source File (XML)
* Copy to LocalPath: `~/BackupTool/scripts/com.digitalocean.backup.xml`
* The "Label" key needs to match the xml filename and script filename.
* A single `Program` string key/value pair is required (designed for script files).

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