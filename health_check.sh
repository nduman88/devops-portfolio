#!/bin/bash
echo "===== HEALTH CHECK FOR $(hostname) - $(date) ====="
DISK_THRESHOLD=80
DISK_USAGE=$(df / | tail -1 | awk '{print $5}' | sed 's/%//')
if [ $DISK_USAGE -gt $DISK_THRESHOLD ]; then
  echo "WARNING: Disk is ${DISK_USAGE}% full!"
else
  echo "OK: Disk is ${DISK_USAGE}% - Healthy"
fi
echo -e "\n--- Running Processes ---"
for service in ssh cron; do
  if pgrep $service > /dev/null; then
    echo "$service is RUNNING"
  else
    echo "$service is DOWN!"
  fi
done
free -h | grep Mem
echo -e "\nHealth Check Completed"
