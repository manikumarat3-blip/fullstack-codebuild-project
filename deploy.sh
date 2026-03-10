#!/bin/bash

EC2_USER=ec2-user
EC2_IP=18.60.225.40
KEY=mykey.pem

echo "Creating key"

echo "$PRIVATE_KEY" > $KEY
chmod 400 $KEY

echo "Copying backend files"

scp -o StrictHostKeyChecking=no -i $KEY -r backend/* $EC2_USER@$EC2_IP:/home/ec2-user/app/

echo "Running backend"

ssh -o StrictHostKeyChecking=no -i $KEY $EC2_USER@$EC2_IP << EOF

pkill gunicorn

cd app

pip3 install -r requirements.txt

nohup gunicorn -b 0.0.0.0:5000 app:app &

EOF
