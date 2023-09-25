#!/usr/bin/bash

cd /workspace

FILENAME='awscliv2.zip'
rm -f "/workspace/$FILENAME"
rm -rf "/workspace/aws"

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "$FILENAME"
unzip $FILENAME 2>&1 >/dev/null
sudo ./aws/install
echo ""
echo "Install complete. Checking identity"
echo "aws sts get-caller-identity"
aws sts get-caller-identity

cd $PROJECT_ROOT