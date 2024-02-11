#!/bin/bash

# Define paths
PROGRAM_NAME="networkMonitor"
PLIST_NAME="com.example.networkmonitor.plist"
INSTALL_DIR="$HOME/Library/Application Support/$PROGRAM_NAME"
LAUNCH_AGENTS_DIR="$HOME/Library/LaunchAgents"
PLIST_PATH="$LAUNCH_AGENTS_DIR/$PLIST_NAME"

# Unload the launch agent
launchctl unload "$PLIST_PATH"

# Remove the plist file
rm -f "$PLIST_PATH"

# Remove the installation directory
rm -rf "$INSTALL_DIR"

echo "Uninstallation complete."
