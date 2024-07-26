#!/bin/bash

USER_ID=$(id -u )
#check the user is sudo or not 
if [ $USER_ID -eq 0 ]
then    
    echo "super user"
else 
    echo "need super user access"
    exit 1 # manually exiting 
fi 

# store in the log file 
T=$(date +%F-%H-%M-%S)
F_Name=$(echo $0 | cut -d "." -f1 )
l_file=/tmp/$F_Name-$T.log

r="\e[31m"
g="\e[32m"
y="\e[33m"
n="\e[0m"

echo "please enter the Password"
read   PASSWD

valid(){
    if [ $? -eq 0 ]
    then 
        echo -e " $g installing successfully..$2 $n"
    else
        echo -e  "$r  not installed..$2 $n"
        exit 1 # manually exiting 
    fi 
}

dnf install mysql-server -y &>> $l_file
valid $? "mysql-server"

systemctl enable mysqld  &>> $l_file
valid $? "enableing "

systemctl start mysqld  &>> $l_file
valid $? "start the service" 

# mysql_secure_installation --set-root-pass ExpenseApp@1   &>> $l_file
# valid $? "db password setuped"
echo "hello 1"
mysql -h -uroot -p $PASSWD -e "show databases"   &>> $l_file
if [ $? -eq 0 ]
then 
    echo "hello 2"
    echo "password already setuped .. ,skipping "
else
    echo "hello 3"
    echo "need to setup the password" 
     mysql_secure_installation --set-root-pass $PASSWD  &>> $l_file
     valid $? "root password setuped "
     echo "hello 4"
fi 



