#!/bin/bash

LOG_FILE="${1:-sample.log}"

if [[ ! -f "$LOG_FILE" ]]; then
    echo "Usage: $0 [log_file]"
    echo "Error: Log file '$LOG_FILE' not found."
    exit 1
fi

echo "Log Analysis Report for: $LOG_FILE"
echo "==================================="

# Count errors using grep
error_count=$(grep -c "ERROR:" "$LOG_FILE")
echo "Total ERROR lines: $error_count"

echo ""
echo "Unique IP Addresses found in INFO lines:"
# Extract all IP addresses from INFO lines, remove duplicates, and sort
grep "INFO:" "$LOG_FILE" | \
    grep -oE '[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+' | \
    sort -u
echo "Unique Error Types:"
grep "ERROR:" "$LOG_FILE" | awk -F'ERROR: ' '{print $2}' | awk '{print $1}' | sort | uniq
echo "==================================="