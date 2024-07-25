#!/bin/bash

UU=$(id -u )
if [ $UU -eq 0 ]
then 
    echo "super user"
else
    echo " need super user access"
    exit 1 # exit manually 
fi 

