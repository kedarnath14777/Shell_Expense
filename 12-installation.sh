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

echo "now you can install"

dnf install nginx -y 
if [ $? -eq 0 ]
then 
    echo "installed successfully"
else
    echo "not installed "
    exit 1 # manullay exit 
fi 

dnf install mysql -y 
if [ $? -eq 0 ]
then 
    echo "installed successfully"
else
    echo "not installed "
    exit 1 # manullay exit 
fi 