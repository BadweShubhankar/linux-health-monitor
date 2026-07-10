#!/bin/bash
# Get project root directory
PROJECT_DIR="$(cd "$(dirname "$0")/.." && pwd)"

# Load configuration
source "$PROJECT_DIR/config/config.conf"

# Load logger
source "$PROJECT_DIR/scripts/logger.sh"


#get disk usage of root fileSystem
DISK_USAGE=$(df / | awk 'NR==2 {gsub("%",""); print $5}')

#Compare with Threshold
if [ "$DISK_USAGE" -ge "$DISK_LIMIT" ]; then
	log_message WARNING "HIGH Disk USAGE: ${DISK_USAGE}%"
else
	log_message INFO "DISK Usage MORAML: ${DISK_USAGE}%"
fi
