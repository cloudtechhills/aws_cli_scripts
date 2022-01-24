#!/bin/bash

#Date Created: 24/1/2022
#A SIMPLE SCRIPT THAT CREATES, LIST AND DELETE AN AWS S3 BUCKET IN A SINGLE AUTOMATION
#ENSURE YOU HAVE 'figlet' INSTALLED IN YOUR LINUX SHELL.

figlet "CloudTechHills"


echo "THIS SCRIPT CREATES, LIST AND DELETE AN AWS S3 BUCKET IN A SINGLE AUTOMATION"
sleep 1

#ENTER BUCKET NAME
read -p "Enter Name of Bucket: " bucket_name

#CREATE BUCKET WITH NAME
echo "Creating Bucket..."
sleep 1
aws s3 mb "s3://${bucket_name}"


#CHECK IF BUCKET CREATION WAS UNSUCCESSFUL OR SUCCESSFUL.
if [ "$?" -eq 1 ]; 
then
    sleep 1
    echo "Bucket creation unsuccessful!"
    exit 1
else
    sleep 1 
    echo "${bucket_name} Bucket was created successfully!"
fi   

#LIST CREATED BUCKET
sleep 1
aws s3 ls

#DELETE BUCKET
# sleep 1
# echo "Deleting Bucket"
# aws s3 rb "s3://${bucket_name}"

#LOGICAL APPROACH TO DELETE BUCKET
read -p "Do you wish to delete ${bucket_name} bucket? " reponse

if [[ "${response}" = "yes" ]];
then
    sleep 1
    echo "Deleting Bucket"
    aws s3 rb "s3://${bucket_name}"
fi

