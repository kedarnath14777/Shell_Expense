#!/bin/bash

u=$(id -u )
if [ $id -eq 0 ]
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

dnf insatll git -y 
package $? "git"
dnf insatll maven -y 
package $? "maven"
dnf insatll tree -y 
package $? "tree"
