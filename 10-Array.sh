#!/bin/bash

Array1=("Ansible","git","docker","Kubernetes")

echo "print course 1 is ::"$Array1[0]

for i in $Array1
do 
  echo "couses are ::" $[i]
done 
