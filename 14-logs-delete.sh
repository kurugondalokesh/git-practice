#!/bin/bash

SOURCE_FILE=/home/ec2-user/logs

if [ -d $SOURCE_FILE ]
then
    echo "$SOURCE_FILE  exists"
else 
    echo "$SOURCE_FILE does not exist"
    exit 1
fi

FILES=$(find ${SOURCE_FILE} -n "*.log" -mtime +14)
echo "Files : $FILES"

while IFS=read -r line
do
    echo "Deleting line : $line"

done <<< $FILES