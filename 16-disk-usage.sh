#!/bin/bash

DISK_USAGE=$(df -ht | grep xfs)
DISK_THRESHOLD=5

while IFS= read -r line
do
    echo $line
done <<< $DISK_USAGEasvcb 