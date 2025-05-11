#!/bin/bash

# Define source and destination directories
SOURCE_DIR="source_data"
BACKUP_BASE_DIR="backups"

# Create a timestamp for the backup folder name (e.g., YYYY-MM-DD_HHMMSS)
TIMESTAMP=$(date +"%Y-%m-%d_%H%M%S")
DESTINATION_DIR="$BACKUP_BASE_DIR/backup_$TIMESTAMP"

echo "Starting backup..."
echo "Source: $SOURCE_DIR"
echo "Destination: $DESTINATION_DIR"

# Create the timestamped destination directory
mkdir -p "$DESTINATION_DIR"

# Check if mkdir was successful (basic error check)
if [ $? -ne 0 ]; then
  echo "Error: Could not create destination directory '$DESTINATION_DIR'."
  exit 1
fi

# Copy the entire source directory using cp -r (recursive)
# Use rsync for more advanced features later (preserves permissions, faster incremental)
cp -r "$SOURCE_DIR"/* "$DESTINATION_DIR/"

# Check if copy was successful
if [ $? -eq 0 ]; then
  echo "Backup completed successfully!"
  ls -l "$DESTINATION_DIR" # List contents of backup for verification
else
  echo "Error: Backup failed."
  exit 1
fi

exit 0