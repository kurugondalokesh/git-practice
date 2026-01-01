#!/bin/bash

DISK_USAGE=$(df -hT | grep xfs)
DISK_THRESHOLD=5

while IFS= read -r line
do
    echo $line
    USAGE=$(echo $line | grep xfs | awk -F " " '{print $6f}' | cut -d "%" -f1)
    PARTITION=$(echo $line | grep xfs | awk -F " " '{print $NF}')
    if [ $USAGE -ge $DISK_THRESHOLD]
    then
        echo "$PARTITION is more than $DISK_THRESHOLD, current usage : $USAGE "

done <<< $DISK_USAGE 