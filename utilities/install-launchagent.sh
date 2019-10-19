#!/usr/bin/env bash
# launchctl unload -w ~/Library/LaunchAgents/com.a1auto-digitalocean.backup.plist
# $(which sh) ~/BackupTool/utilities/install-launchagent.sh ~/BackupTool/scripts/com.a1auto-digitalocean.backup.xml

# Agent Source File
if [[ $# -eq 0 && -f $1 ]]; then
    echo "No Source File!"
    exit 1;
else
    SOURCE_FILE=$1
fi

# Agent Name
AGENT_NAME=$(basename -- ${SOURCE_FILE} .xml)

# Agent Destination
AGENT=~/Library/LaunchAgents/${AGENT_NAME}.plist

# Get Agent Installation Status
function agentIsInstalled(){
    launchctl list | grep -q "${AGENT_NAME}"
}

# Remove Existing Agent.
if agentIsInstalled; then
    echo "Uninstalling Existing Agent..."
    launchctl unload -w "${AGENT}"
fi

# Copy New Agent.
echo "Copying New Agent: $SOURCE_FILE..."
rm "${AGENT}"
cp "${SOURCE_FILE}" "${AGENT}"

# Read PropertyList for Associated Script
SCRIPT=$(defaults read "${AGENT}" Program)

# Set Script Executable Permissions.
if [[ -f ${SCRIPT} ]]; then
    chmod a+x "${SCRIPT}";
    echo "Executable Permissions Set: $SCRIPT..."
fi

# Install New Agent.
echo "Installing New Agent: $AGENT..."
launchctl load -w "${AGENT}"

# Verify New Agent is Installed.
if agentIsInstalled; then
    echo "Agent Installed Successfully."
    #launchctl start ${AGENT}
    #echo "Running Agent..."
else
    echo "Agent Installation Failed."
fi

exit 0