#!/bin/bash
# Get project root directory
PROJECT_DIR="$(cd "$(dirname "$0")/.." && pwd)"

# Load configuration
source "$PROJECT_DIR/config/config.conf"


log_message()
{
	local LEVEL=$1
	local MESSAGE=$2
	echo  "$(date '+%Y-%m-%d %H:%M:%S') [$LEVEL] $MESSAGE" >> "$LOG_FILE"
}
