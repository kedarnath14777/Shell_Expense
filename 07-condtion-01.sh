#!/bin/bash

echo "enter the number "
read -s num 
echo " the number " $num

if[ $num -gt 18 ]
 echo " eligible for voting"
 echo "Age is ::" $num 
else 
 echo " not eligible for voting"
fi 