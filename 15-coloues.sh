#!/bin/bash

us=$(id -u )

if [ $us -eq 0 ]
then
    echo -e " $G super user $N "
else 
    echo " nedd super user access"
    exit 1 # manually exiting 
fi 

t=$(date +%F-%H-%m-%s)
name1=$(echo $0 | cut -d "." -f1)
l_file=/tmp/$t-$name1.log

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

package(){
    if [ $1 -eq 0 ]
    then
        echo -e " $G installed successfully..$2 $N"
    else
        echo -e  "$R not installed.. $2  $N"
        exit 1
    fi 
}

dnf install  git -y &>> $l_file
package $? "git"
dnf install maven -y  >> $l_file
package $? "maven"
dnf install tree -y >> $l_file
package $? "tree"
