#!/bin/bash

SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14}

USAGE(){
    echo "Usage :: sh 15-backup.sh <SOURCE_DIR> <DEST_DIR> <DAYS(optional)>"
}

if [ $# -lt 2 ]
then
    USAGE
fi

if [ ! -d $SOURCE_DIR ]
then
    echO "$SOURCE_DIR does not exist please check"
fi

if [ ! -d $DEST_DIR ]
then
    echO "$DEST_DIR does not exist please check"
fi

FILES=$(find ${SOURCE_DIR} -name "*.log" -mtime +14)

if [ ! -z $FILES ]
then
    echo "Files found"
else
    echo "No files found"
fi