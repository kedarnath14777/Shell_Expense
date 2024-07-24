#!/bin/bash


USER_ID=$(id -u )

#create the timestamp and log file 
TIME_STAMP=$(date +%F-%H-%M-%S )
SRIPT_NAME=$( echo $0 | cut -d "." -f1 )
LL=/tmp/$SRIPT_NAME-$TIME_STAMP.log
#check user is sudo or not 
if [ $USER_ID -eq 0 ]
then 
   echo "super user"
else
 echo "need super user sreadentails"
 exit 1 # exit manually 
fi 

echo "wellcome"
