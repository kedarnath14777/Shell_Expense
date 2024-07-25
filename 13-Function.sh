#!/bin/bash

UU=$(id -u )

valid_package(){
    if [ $1 -eq 0 ]
    then 
         echo " installed successfully $2"
    else
        echo " not installed $2"
        exit 1 # manually exit 

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
