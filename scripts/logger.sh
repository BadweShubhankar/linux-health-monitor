#!/bin/bash

# load configration

source config/config.conf

log_message()
{
	local LEVEL=$1
	local MESSAGE=$2
	echo  "$(date '+%Y-%m-%d %H:%M:%S') [$LEVEL] $MESSAGE" >> "$LOG_FILE"
}
