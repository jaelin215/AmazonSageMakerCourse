#!/bin/bash
set -e

echo "Setting AWS credentials..."
echo "export AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID}" >> ~/.bashrc
echo "export AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY}" >> ~/.bashrc
echo "export echo =${AWS_DEFAULT_REGION:-us-east-1}" >> ~/.bashrc
source ~/.bashrc