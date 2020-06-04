#!/bin/bash                                                
                                                           
BASE_PATH="/scripts/monitoring/netstat"                    
TIME=$(date +%F.%T | tr ":" "_")                           

#Clear log files older than 2 days 
find /var/log -name "*.log" -type f -mtime +3 -exec rm -f {} \;

#Capture netstat connections                                                           
netstat -nautp | grep "LISTEN" > $BASE_PATH/file-$TIME.log 
