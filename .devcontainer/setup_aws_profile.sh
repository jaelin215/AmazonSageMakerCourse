#!/bin/bash
set -e

echo "🔐 Setting up 'ml_user' AWS CLI profile..."

# Check required variables
if [[ -z "$AWS_ACCESS_KEY_ID" || -z "$AWS_SECRET_ACCESS_KEY" ]]; then
  echo "❌ AWS_ACCESS_KEY_ID or AWS_SECRET_ACCESS_KEY is not set."
  exit 1
fi

# Use default region if not explicitly set
REGION="${AWS_DEFAULT_REGION:-us-east-1}"

mkdir -p ~/.aws

# Credentials file
cat <<EOF > ~/.aws/credentials
[ml_user]
aws_access_key_id = ${AWS_ACCESS_KEY_ID}
aws_secret_access_key = ${AWS_SECRET_ACCESS_KEY}
EOF

# Config file
cat <<EOF > ~/.aws/config
[profile ml_user]
region = ${REGION}
output = json
EOF

# Optional: Export SageMaker role as env var
echo "export AWS_SAGEMAKER_ROLE=${AWS_SAGEMAKER_ROLE}" >> ~/.bashrc
echo "export AWS_DEFAULT_REGION=${REGION}" >> ~/.bashrc
source ~/.bashrc

echo "✅ Profile 'ml_user' created with region '${REGION}'."
echo "✅ SageMaker role set as '${AWS_SAGEMAKER_ROLE}'."