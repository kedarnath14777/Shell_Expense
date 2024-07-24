#!/bin/bash
USER_ID=$(id -u )

#create the timestamp and log file 
TIME_STAMP=$(date +%F-%H-%M-%S )
SRIPT_NAME=$( echo $0 | cut -d "." -f1 )
LL=/tmp/$SRIPT_NAME-$TIME_STAMP.log
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
#check user is sudo or not 
if [ $USER_ID -eq 0 ]
then 
   echo "super user"
else
 echo "need super user sreadentails"
 exit 1 # exit manually 
fi 

echo -e " ...$R hello  world ...$N "

exit_status(){

    if [ $1 -eq 0 ]
    then 
     echo -e " $G installed successfully.. $2 $N "
    else
    echo -e " $R not installed.. $2 $N"
    exit 1 # exit manually 
    fi 

}

dnf install mysql-server -y &>> $LL
exit_status $? "mysql serverd"

systemctl enable mysqld &>> $LL
exit_status $? "enable mysqld"

systemctl start mysqld &>> $LL
exit_status $? "start  mysqld"

#check the db password setuped or not 


mysql -h 54.157.161.195 -u root -p ExpenseApp@1 -e "show databases" &>> LL
if [ $? -eq 0 ]
then
echo -e  " $G root password is already setuped .. Skippiing $N "
else
mysql_secure_installation --set-root-pass ExpenseApp@1
exit_status $? "password setup" 
fi 



