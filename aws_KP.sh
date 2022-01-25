#!/bin/bash

#FOR LEARNING PURPOSES
#THIS SCRIPTS AUTOMATES THE PROCESS OF CREATING, SAVING AND DELETING AWS KEY-PAIRS USING THE AWS CLI

figlet CloudTechHills
sleep 1 

figlet AWS K-P Series
sleep 1

#ENTER KEY NAME 
read -p "Enter name of key to be created: " MyKeyPair
sleep 1

figlet "Creating ${MyKeyPair}..."
sleep 1 

#CREATE THE AWS KEY-PAIR AND STORE THE OUTPUT TO A FILE
aws ec2 create-key-pair --key-name "${MyKeyPair}" --query 'KeyMaterial' --output json > "${MyKeyPair}".pem 
echo "${MyKeyPair} created successfully and saved as ${MyKeyPair}.pem"

sleep 1
echo
# CHANGE THE PERMISSIONS ON THE FILE
echo "Key-Pair Permission Changed"
chmod 400 "${MyKeyPair}".pem 


sleep 1

figlet "List Keys"
sleep 1

#DISPLAY THE KEY-PAIR
aws ec2 describe-key-pairs --key-name "${MyKeyPair}"
sleep 1

figlet "Deleting ${MyKeyPair}"
#DELETE YOUR KEY-PAIR FROM AWS AND ALSO FROM YOUR LOCAL FOLDER
aws ec2 delete-key-pair --key-name "${MyKeyPair}" | rm "${MyKeyPair}".pem
echo "${MyKeyPair} deleted successfully!"

sleep 1
figlet 'Thank you'