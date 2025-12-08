#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "Please run this script with root privelages"
    exit 1
fi

dnf list installed git

if [ $? -ne 0 ]
then 
    echo "Git is not installed, will install it"
    dnf install git -y
    if [ $? -ne 0 ]
    then
        echo "Git not installed successfully"
        exit 1
    else    
        echo "Git installed succesfully"
    fi
else 
    echo "Git already installed"
fi