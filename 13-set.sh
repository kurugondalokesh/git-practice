#!/bin/bash

# set -e   #setting automatic exit if any error appears
set -ex # for debug and exit when encountering a error

function(){
    echo "failed at $1:$2"
}

 trap ' failure "${LINENO}" "$BASH_COMMAND" ' ERR # ERR is error signal when a error occurs this wil trap the error and display

echo "Command before error"
echooo "Command with error"
echo "Command after error"