#!/bin/bash

#Load configration
source config/config.conf

#load loggger
source scripts/logger.sh

#check service status
if systemctl is-active --quiet "$SERVICE_NAME"; then
	log_message INFO "$SERVICE_NAME service is running."
else 
	log_message WARNING "$SERVICE_NAME service is down."
	source scripts/restart_service.sh
fi
