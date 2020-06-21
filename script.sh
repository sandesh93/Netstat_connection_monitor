#!/bin/bash

BASE_PATH="/scripts/monitoring/netstat"
TIME=$(date +%F.%T | tr ":" "_")

#Clear log files older than 2 days
find $BASE_PATH -name "*.log" -type f -mmin +59 -exec rm -f {} \;    ### for files older than x min

find $BASE_PATH -name "*.log" -type f -mtime +3 -exec rm -f {} \;    ### for files older than x days

#Capture netstat connections
netstat -nautp | grep "LISTEN" > $BASE_PATH/file-$TIME.log
#####END OF SCRIPT #####
