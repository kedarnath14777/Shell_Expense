#!/bin/bash
echo "print all the arguments :$@"
echo "no of argiments is :$#"
echo " shell script name: $0"
echo "current user is :$USER"
echo "Current directory is $PWD"
echo "know the hostname :$HOSTNAME"


echo " ppis of current fileis :$$"

sleep 60 &

echo "pid of last command is:$!"

echo "exist status is : $?"

