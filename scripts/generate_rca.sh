#!/bin/bash

source config/config.conf

TIMESTAMP=$(date "+%Y-%m-%d_%H-%M-%S")

REPORT="$RCA_DIR/incident_$TIMESTAMP.txt"

cat << EOF > "$REPORT"
====================================
Incident Report
====================================

Time:
$(date)

Service:
$SERVICE_NAME

Problem:
Service failed to restart.

Action Taken:
Automatic restart attempted.

Final Status:
FAILED

====================================
EOF
