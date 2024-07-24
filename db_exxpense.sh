#!/bin/bash
USER_ID=$(id -u )

#create the timestamp and log file 
TIME_STAMP=$(date +%F-%H-%M-%S )
SRIPT_NAME=$( echo $0 | cut -d "." -f1 )
LL=/tmp/$SRIPT_NAME-$TIME_STAMP.log
R=\e[31m
G=\e[32m
Y=\e[33m
N=\e[0+m
#check user is sudo or not 
if [ $USER_ID -eq 0 ]
then 
   echo "super user"
else
 echo "need super user sreadentails"
 exit 1 # exit manually 
fi 

exit_status(){

    if [ $1 -eq 0 ]
    then 
     echo "installed successfully.. $2"
    else
    echo "not installed.. $2"
    exit 1 # exit manually 
    fi 

}

dnf install mysql-server -y
exit_status $? "mysql server"

