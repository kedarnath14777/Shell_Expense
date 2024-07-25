#!/bin/bash

UU=$(id -u )

valid_package(){
    echo "exist status is :: $1"
    echo "whats is :: $2"
    if [ $1 -eq 0]
     then 
        echo " installed success fully::$2"
     else
        echo " not installed ::$2" 
        exit 1 # manually exxiting 
}

if [ $UU -eq 0 ]
then 
    echo "super user"
else
    echo " need super user access"
    exit 1 # exit manually 
fi 

dnf install maven  -y 
valid_package $? "maven "
