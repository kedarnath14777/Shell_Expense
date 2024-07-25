#!/bin/bash

echo "enter the number "
num=$1

if[ $num -gt 18 ]
then 
 echo " eligible for voting"
 echo "Age is ::" $num 
else 
 echo " not eligible for voting"
fi 