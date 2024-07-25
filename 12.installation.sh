#!/bin/bash

#check user is sudo or not 

U=$(id -u)

if [ $U -eq 0 ]
then 
    echo "super user"
else
    echo "need super user access"
    exit 1 
fi 

echo "no you can install"

