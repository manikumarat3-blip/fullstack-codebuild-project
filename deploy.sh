#!/bin/bash

EC2_IP=18.60.225.40

echo "Copying backend files"

scp -i backend.pem -o StrictHostKeyChecking=no -r backend ec2-user@$EC2_IP:/home/ec2-user/

echo "Running backend"

ssh -i backend.pem -o StrictHostKeyChecking=no ec2-user@$EC2_IP << 'EOF'
cd backend
pip3 install -r requirements.txt
pkill -f app.py || true
nohup python3 app.py > output.log 2>&1 &
EOF
