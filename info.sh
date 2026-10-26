#!/bin/bash
echo "=== System Info ==="
echo "Hostname: $(hostname)"
echo "Date: $(date)"
echo "User: $(whoami)"
echo "Disk: $(df -h / | tail -1)"
echo "Memory: $(free -h | grep Mem)"
