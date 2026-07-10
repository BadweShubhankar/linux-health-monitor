#!/bin/bash

# Change to project root directory
cd "$(dirname "$0")/.."

# Load configuration
source config/config.conf

# Load logger
source scripts/logger.sh

log_message INFO "========== Health Check Started =========="

# Execute all monitoring scripts
bash scripts/check_cpu.sh
bash scripts/check_ram.sh
bash scripts/check_disk.sh
bash scripts/check_service.sh

log_message INFO "========== Health Check Completed =========="
