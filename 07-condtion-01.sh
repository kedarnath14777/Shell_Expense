#!/bin/bash

echo "enter the number "
read -p num
echo " the number " $num

if[ $num -gt 18 ]
then 
 echo " eligible for voting"
 echo "Age is ::" $num 
else 
 echo " not eligible for voting"
fi 