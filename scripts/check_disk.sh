#!/bin/bash
#Load Configration
source config/config.conf

#Load logger
source scripts/logger.sh

#get disk usage of root fileSystem
DISK_USAGE=$(df / | awk 'NR==2 {gsub("%",""); print $5}')

#Compare with Threshold
if [ "$DISK_USAGE" -ge "$DISK_LIMIT" ]; then
	log_message WARNING "HIGH Disk USAGE: ${DISK_USAGE}%"
else
	log_message INFO "DISK Usage MORAML: ${DISK_USAGE}%"
fi
