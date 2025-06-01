#!/bin/bash
set -e

echo "🔐 Setting up 'ml_user_predict' AWS CLI profile..."

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
region = ${AWS_DEFAULT_REGION:-us-east-1}
output = json
EOF

echo "✅ Profile 'ml_user_predict' created."