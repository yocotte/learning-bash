#!/bin/bash

echo "==================================="
echo "     System Information Report     "
echo "==================================="
echo "Generated on: $(date)"
echo ""

echo "Hostname: $(hostname)"
echo "OS Info: $(uname -a)" # Kernel info
# More user-friendly OS info might require parsing /etc/os-release
if [ -f /etc/os-release ]; then
    echo "Distribution: $(grep PRETTY_NAME= /etc/os-release | cut -d'=' -f2 | tr -d '"')"
fi
echo ""

echo "Uptime: $(uptime -p)"
echo ""

echo "Disk Usage (Root Filesystem /):"
# df -h / shows human-readable disk usage for the root filesystem
df -h / | grep -v Filesystem # Use grep -v to exclude the header line
echo ""

echo "Memory Usage:"
# free -h shows human-readable memory usage
free -h
echo ""

echo "Current User: $(whoami)"
echo "Logged in Users:"
who # Shows who is logged on
echo ""

echo "==================================="
echo "           Report End              "
echo "==================================="