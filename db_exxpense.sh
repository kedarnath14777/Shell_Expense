#!/bin/bash


USER_ID=$(id -u )

#create the timestamp and log file 
TIME_STAMP=$($date +%f-%H-%M-%S )
echo  $TIME_STAMP
# SRIPT_NAME=$( $0 | awk -d "." -f1 )

# echo $SRIPT_NAME