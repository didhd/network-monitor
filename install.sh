#!/bin/bash

# Define paths
PROGRAM_NAME="networkMonitor"
PLIST_NAME="com.example.networkmonitor.plist"
INSTALL_DIR="$HOME/Library/Application Support/$PROGRAM_NAME"
LAUNCH_AGENTS_DIR="$HOME/Library/LaunchAgents"
PLIST_PATH="$LAUNCH_AGENTS_DIR/$PLIST_NAME"
SOURCE_FILE="main.swift"
COMPILED_PROGRAM="$INSTALL_DIR/$PROGRAM_NAME"

# Ensure Swift is installed
if ! type swift > /dev/null; then
    echo "Swift not installed. Please install Swift."
    exit 1
fi

# Create installation directory
mkdir -p "$INSTALL_DIR"

# Compile Swift program
swiftc "$SOURCE_FILE" -o "$COMPILED_PROGRAM"

# Check if compilation was successful
if [ ! -f "$COMPILED_PROGRAM" ]; then
    echo "Compilation failed."
    exit 1
fi

# Create the launch agent plist file for automatic startup
cat > "$PLIST_PATH" <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>$PLIST_NAME</string>
    <key>Program</key>
    <string>$COMPILED_PROGRAM</string>
    <key>RunAtLoad</key>
    <true/>
    <key>StandardErrorPath</key>
    <string>$INSTALL_DIR/error.log</string>
    <key>StandardOutPath</key>
    <string>$INSTALL_DIR/output.log</string>
</dict>
</plist>
EOF

# Load the launch agent
launchctl load "$PLIST_PATH"

echo "Installation complete. $PROGRAM_NAME will now run at startup."
