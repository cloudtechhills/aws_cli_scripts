#!/bin/bash

#THIS SCRIPT WILL CREATE A NEW AWS USER, LIST THE USERS IN THE AWS ACCOUNT AND DELETE THE USER.

figlet "CloudTechHills"

#COLLECT USER DATA
sleep 1
read -p "Enter Name of NewUser: " user

#CREATE THE NEW USER ACCOUNT
sleep 1
aws iam create-user --user-name "${user}" 

#CHECK IF THE NEW-USER CREATION WAS UNSUCCESSFUL OR SUCCESSFUL.
if [ "$?" -eq 1 ]; 
then
    sleep 1
    echo "${user} was not created."
    exit 1
else
    sleep 1 
    echo "${user} was created successfully!"
fi

#LIST USERS 
figlet "IAM LIST USERS"
aws iam list-users
sleep 1


#DELETE USER 
sleep 1
figlet "Deleting Bucket"
aws iam delete-user --user-name ${user}



