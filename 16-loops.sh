us=$(id -u )

if [ $us -eq 0 ]
then
    echo -e " $G super user $N "
else 
    echo " nedd super user access"
    exit 1 # manually exiting 
fi 
echo "please enter the packages"
packages=$@

t=$(date +%F-%H-%m-%s)
name1=$(echo $0 | cut -d "." -f1)
l_file=/tmp/$t-$name1.log

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

valid_1(){
    if [ $1 -eq 0 ]
    then 
        echo -e " $G installed successfully..$2 $N "
    else
        echo -e "$Y not installed successfully..$2 $N"
        exit 1
    fi 

}

for i in $@
do 
echo "all packages is $@"
dnf list installed $i &>> l_file
    if [ $? -eq 0 ]
      then 
            echo -e " $Y alreaddy installed.. $i.. SKPPING $N "
    else 
             echo  -e "$G not installed need to do $i $N"
            dnf install $i -y &>> l_file
            valid_1 $? "installing $i "
    fi 

done
