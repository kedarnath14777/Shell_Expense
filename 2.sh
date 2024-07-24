#!/bin/bash
USER_ID=$(id -u )

#create the timestamp and log file 
TIME_STAMP=$(date +%F-%H-%M-%S )
SRIPT_NAME=$( echo $0 | cut -d "." -f1 )
LL=/tmp/$SRIPT_NAME-$TIME_STAMP.log
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
