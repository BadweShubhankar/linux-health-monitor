#!/bin/bash

#load configration
source config/config.conf

#load logger
source scripts/logger.sh

#get RAM usage percentage
RAM_USAGE=$(free | awk '/Mem:/{printf "%.0f" , $3/$2 * 100}')

if [ "$RAM_USAGE" -ge "$RAM_LIMIT" ]; then
	log_message WARNING "High RAM Usage: ${RAM_USAGE}%"
else
	log_message INFO "RAM Usage Normal : ${RAM_USAGE}%"
fi

