#!/bin/bash

LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOGS_FILE="$LOGS_FOLDER/$SCRIPT_NAME-$TIMESTAMP.log"
#mkdir $LOGS_FOLDER &>>$LOGS_FILE


USERID=$(id -u)
CHECKROOT (){
    if [ $USERID -ne 0 ]
    then
        echo -e "$R Please run this script with root privelages $N" | tee -a $LOGS_FILE
        exit 1
    fi
}

VALIDATE (){
    if [ $1 -ne 0 ]
    then
        echo -e "$2 is $R failed $N" | tee -a $LOGS_FILE

        exit 1
    else 
        echo "$2 is $G successfull $N" | tee -a $LOGS_FILE
    fi
}

echo "Script started at : $(date)" | tee -a $LOGS_FILE

CHECKROOT

for package in $@
do  
    dnf list installed $package | tee -a $LOGS_FILE
    if [ $? -ne 0 ]
    then
        echo "$package is not installed going to install it" | tee -a $LOGS_FILE
        dnf install $package -y | tee -a $LOGS_FILE
        VALIDATE $? $package | tee -a $LOGS_FILE

    else
        echo "$package already installed" | tee -a $LOGS_FILE
    fi
done