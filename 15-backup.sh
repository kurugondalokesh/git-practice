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