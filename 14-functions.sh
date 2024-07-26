#!/bin/bash

u=$( id -u )
time=$(date +%F-%H-%M-%S)
script_name=$( echo $0 | cut -d "." -f1)
s_c=/tmp/$script_name-$time.log

# check the user is sudo or not 
if [ $u -eq 0 ]
then 
    echo " super user"
else 
    echo "need super user access"
    exit 1 # manually exit 
fi 
