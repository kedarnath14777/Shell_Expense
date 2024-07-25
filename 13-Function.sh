#!/bin/bash

UU=$(id -u )

valid_package(){
    echo "exist status is :: $1"
    echo "whats is :: $2"
}

if [ $UU -eq 0 ]
then 
    echo "super user"
else
    echo " need super user access"
    exit 1 # exit manually 
fi 

dnf install nginx -y 
valid_package $? "nginx"
