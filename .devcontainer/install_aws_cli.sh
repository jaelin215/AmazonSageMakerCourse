#!/bin/bash

# install-aws-cli.sh
# Installs AWS CLI v2 in a GitHub Actions runner or Codespace
# In terminal, run >> chmod +x install_aws_cli.sh
# Then run >> ./install_aws_cli.sh

set -e

echo "Installing AWS CLI v2..."

# Download
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"

# Unzip
unzip -q awscliv2.zip

# Install
sudo ./aws/install

# Verify
echo "AWS CLI version:"
aws --version

# Cleanup
rm -rf awscliv2.zip aws

echo "✅ AWS CLI installed successfully"