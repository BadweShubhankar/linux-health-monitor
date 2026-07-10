#!/bin/bash

# Get project root directory
PROJECT_DIR="$(cd "$(dirname "$0")/.." && pwd)"

# Load configuration
source "$PROJECT_DIR/config/config.conf"

# Load logger
source "$PROJECT_DIR/scripts/logger.sh"


log_message INFO "Attempting to restart $SERVICE_NAME..."

sudo systemctl restart "$SERVICE_NAME"

sleep 2

if systemctl is-active --quiet "$SERVICE_NAME"; then

    log_message INFO "$SERVICE_NAME restarted successfully."

else

    log_message ERROR "$SERVICE_NAME restart failed."

    source scripts/generate_rca.sh

fi
