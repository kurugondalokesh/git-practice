#!/bin/bash

USERID=$(id -u)
CHECKROOT (){
    if [ $USERID -ne 0 ]
    then
        echo -e "$R Please run this script with root privelages $N"
        exit 1
    fi
}

VALIDATE (){
    if [ $1 -ne 0 ]
    then
        echo -e "$2 is $R failed $N"
        exit 1
    else 
        echo "$2 is $G successfull $N"
    fi
}


CHECKROOT

for package in $@
do  
    echo dnf install $package -y
done