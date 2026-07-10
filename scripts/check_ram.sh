#!/bin/bash
# Get project root directory
PROJECT_DIR="$(cd "$(dirname "$0")/.." && pwd)"

# Load configuration
source "$PROJECT_DIR/config/config.conf"

# Load logger
source "$PROJECT_DIR/scripts/logger.sh"


#get RAM usage percentage
RAM_USAGE=$(free | awk '/Mem:/{printf "%.0f" , $3/$2 * 100}')

if [ "$RAM_USAGE" -ge "$RAM_LIMIT" ]; then
	log_message WARNING "High RAM Usage: ${RAM_USAGE}%"
else
	log_message INFO "RAM Usage Normal : ${RAM_USAGE}%"
fi

