#!/bin/bash

USERID=$(id -u)

VALIDATE (){
    if [ $1 -ne 0 ]
    then
        echo "$2 is failed"
    else 
        echo "$2 is successfull"
    fi
}

if [ $USERID -ne 0 ]
then
    echo "Please run this script with root privelages"
    exit 1
fi

dnf list installed git

VALIDATE $?

if [ $? -ne 0 ]
then 
    echo "Git is not installed, will install it"
    dnf install git -y
    VALIDATE $? "Installing GIT"
else 
    echo "Git already installed"
fi

dnf list installed mysql

if [ $? -ne 0 ]
then
    echo "Mysql is not installed, we are installiung it now"
    dnf install mysql -y
    VALIDATE $? "Installing Mysql"
else 
    echo "My sql is already installed"
fi