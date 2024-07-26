#!/bin/bash 

USER_ID=$(id -u )
if [ $USER_ID -eq 0 ]
then 
    echo "super user"
else 
    echo "not a super user"
    exit 1 # manually exiting 
fi 

#log file 
TIME=$(date +%F-%H-%M-%S )
SCP=$( echo $0 | cut -d "." -f1 )
log_file=/tmp/$TIME-$SCP.log

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

valid_pack(){
    if [ $? -eq 0 ]
    then 
        echo -e "$G successfully.. $2 $N" 
    else
        echo -e "$R not done ..$2 $N "
        exit 1 
    fi 
}

dnf module disable nodejs -y  $>> $log_file
valid_pack $? "Disable nodejs"

dnf module enable nodejs:20 -y   $>> $log_file
valid_pack $? "enableing  nodejs : 20 "

dnf install nodejs -y >> $log_file
valid_pack $? "installing nodejs "

id expense $>> $log_file
if [ $? -eq 0 ]
then 
    echo " user is alreay existed"
else 
    echo "user not existed need to create the user"
    useradd expense
fi 


