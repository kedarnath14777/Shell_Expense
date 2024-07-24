#!/bin/bash


USER_ID=$(id -u )

#create the timestamp and log file 
TIME_STAMP=$(date +%F-%H-%M-%S )
echo  $TIME_STAMP
SRIPT_NAME=$( $0 | cut -d "." -f1 )

echo $SRIPT_NAME