#!/bin/bash

LOG_FILE="sample.log"

echo "Log Analysis Report for: $LOG_FILE"
echo "==================================="

# Count errors using grep and wc
error_count=$(grep -c "ERROR:" "$LOG_FILE")
echo "Total ERROR lines: $error_count"

echo ""
echo "IP Addresses found in INFO lines:"
# Extract IPs using grep for INFO lines and awk to print the last field
# (Adjust field number $NF if IPs are elsewhere)
grep "INFO:" "$LOG_FILE" | awk '{print $NF}' | sed 's/\.$//' # Basic awk, remove trailing dot if any

# You could also use more specific regex with grep -o or awk directly
# Example with awk matching IP pattern:
# awk '/INFO:/ {for(i=1;i<=NF;i++) if($i ~ /^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$/) print $i}' "$LOG_FILE"

echo "==================================="