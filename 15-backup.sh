#!/bin/bash

SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14}
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)

USAGE(){
    echo "Usage :: sh 15-backup.sh <SOURCE_DIR> <DEST_DIR> <DAYS(optional)>"
}

if [ $# -lt 2 ]
then
    USAGE
fi

if [ ! -d $SOURCE_DIR ] # true if directory exist ! makes it false
then
    echO "$SOURCE_DIR does not exist please check"
fi

if [ ! -d $DEST_DIR ]
then
    echO "$DEST_DIR does not exist please check"
fi

FILES=$(find ${SOURCE_DIR} -name "*.log" -mtime +14)

if [ ! -z $FILES ] # true if fles empty ! makes it false
then
    echo "Files found"
    ZIP_FILE="$DEST_DIR/app-logs-$TIMESTAMP.zip"
    find ${SOURCE_DIR} -name "*.log" -mtime +14 | zip $ZIP_FILE -@

    if [ -f $ZIP_FILE ]
    then
        echo "Successfully zipped files"
        
        while IFS= read -r line
        do
            echo "Deleting line : $line"
            rm -rf $line
        done <<< $FILES

    else 
        echo "Files not zipped"
    fi
else
    echo "No files found"
fi