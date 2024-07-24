#!/bin/bash


USER=$( id -u )
# location of the log file 
TIME_STAMP=$(date +%F -%H -%M -%S )
Script_name=$(echo $0 | awk -d "." -f1 )
LOG_FILE=/tmp/$Script_name-$TIME_STAMP.log 
#clours decleare 
R=\e[31m
G=\e[32m
Y=\e[33m
N=\e[0m
#check the user is sudo or not 
if [ $USER -eq 0]
echo "super -user"
else
echo "need super user access"
exit 1 # exit manually if user is not super 
fi 