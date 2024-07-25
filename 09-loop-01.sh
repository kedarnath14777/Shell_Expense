#!/bin/bash

echo "number "
read -p num 

for i in num 
do 
 if [ $num % 3 ]
   then
      echo $num 
 fi 
done 