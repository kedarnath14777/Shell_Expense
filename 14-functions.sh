#!/bin/bash

u=$( id -u )
time=$(date +%F-%H-%M-%S)
script_name=$( echo $0 | cut -d "." -f1)
s_c=/tmp/$script_name-$time.log

# by defaultly only success logs only stores in the log file 
# 1 -> success 
# 2 -> Failure 
# & -> for both the Success and failure 
# to readire the status we must use the >> -> it will appended the bew content with the old content 
# if you give the > -> it will over ride the new connent by removing the old content 


# check the user is sudo or not 
if [ $u -eq 0 ]
then 
    echo " super user"
else 
    echo "need super user access"
    exit 1 # manually exit 
fi 

valid(){
    if [ $1 -eq 0 ]
    then 
        echo "installed successfully.. $2"
    else
        echo " not installes .. $2"
        exit 1 
    fi 
}



dnf install maven  -y &>> $s_c
valid $? "maven"

dnf install git -y &>> $s_c
valid $? "git"

dnf install tree -y &>> $s_c
valid  $? "tree"
