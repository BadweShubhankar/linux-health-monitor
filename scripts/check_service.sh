#!/bin/bash

# Get project root directory
PROJECT_DIR="$(cd "$(dirname "$0")/.." && pwd)"

# Load configuration
source "$PROJECT_DIR/config/config.conf"

# Load logger
source "$PROJECT_DIR/scripts/logger.sh"


#check service status
if systemctl is-active --quiet "$SERVICE_NAME"; then
	log_message INFO "$SERVICE_NAME service is running."
else 
	log_message WARNING "$SERVICE_NAME service is down."
	source "$PROJECT_DIR/scripts/restart_service.sh"
fi
