#!/bin/bash
# Get project root directory
PROJECT_DIR="$(cd "$(dirname "$0")/.." && pwd)"

# Load configuration
source "$PROJECT_DIR/config/config.conf"

# Load logger
source "$PROJECT_DIR/scripts/logger.sh"


# Get CPU Idle percentage
CPU_IDLE=$(top -bn1 | grep "Cpu(s)" | awk '{print $8}' | cut -d'.' -f1)

# Calculate CPU Usage
CPU_USAGE=$((100 - CPU_IDLE))

# Compare with threshold
if [ "$CPU_USAGE" -ge "$CPU_LIMIT" ]; then
    log_message WARNING "High CPU Usage: ${CPU_USAGE}%"
else
    log_message INFO "CPU Usage Normal: ${CPU_USAGE}%"
fi
