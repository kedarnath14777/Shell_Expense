#!/bin/bash

echo "enter the number "
read -s num 
echo " the number " $num

if [ $num -gt 18 ]
then 
   echo " eligible for voting"
    echo "Age is ::" $num 
else 
    echo " not eligible for voting"
fi 

# -eq # Equal
# -ne # Not equal
# -lt # Less than
# -le # Less than or equal
# -gt # Greater than
# -ge # Greater than or equal