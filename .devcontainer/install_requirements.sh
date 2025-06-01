#!/bin/bash
set -e

echo "Installing Python dependencies..."
pip install -r /workspaces/$(basename `git rev-parse --show-toplevel`)/requirements.txt