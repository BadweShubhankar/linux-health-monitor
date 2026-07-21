#!/bin/bash

# Get project root directory
PROJECT_DIR="$(cd "$(dirname "$0")/.." && pwd)"

# Load configuration
source "$PROJECT_DIR/config/config.conf"

# Load logger
source "$PROJECT_DIR/scripts/logger.sh"

MAX_ATTEMPTS=2
RESTART_DELAY=2

for ((attempt=1; attempt<=MAX_ATTEMPTS; attempt++))
do
    log_message INFO "Attempting to restart $SERVICE_NAME... (Attempt $attempt)"

    sudo systemctl restart "$SERVICE_NAME"

    sleep "$RESTART_DELAY"

    if systemctl is-active --quiet "$SERVICE_NAME"; then
        log_message INFO "$SERVICE_NAME restarted successfully on attempt $attempt."
        exit 0
    fi

    log_message WARNING "Restart attempt $attempt failed."
done

log_message ERROR "$SERVICE_NAME restart failed after $MAX_ATTEMPTS attempts."

source "$PROJECT_DIR/scripts/generate_rca.sh"
