#!/bin/bash

source config/config.conf
source scripts/logger.sh

log_message INFO "Attempting to restart $SERVICE_NAME..."

sudo systemctl restart "$SERVICE_NAME"

sleep 2

if systemctl is-active --quiet "$SERVICE_NAME"; then

    log_message INFO "$SERVICE_NAME restarted successfully."

else

    log_message ERROR "$SERVICE_NAME restart failed."

    source scripts/generate_rca.sh

fi
