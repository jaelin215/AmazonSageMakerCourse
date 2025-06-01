#!/bin/bash
set -e

echo "🔐 Setting up 'ml_user_predict' AWS CLI profile..."

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
[ml_user_predict]
aws_access_key_id = ${AWS_ACCESS_KEY_ID}
aws_secret_access_key = ${AWS_SECRET_ACCESS_KEY}
EOF

# Config file
cat <<EOF > ~/.aws/config
[profile ml_user_predict]
region = ${REGION}
output = json
EOF

echo "✅ Profile 'ml_user_predict' created with region '${REGION}'."