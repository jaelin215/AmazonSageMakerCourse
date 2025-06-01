#!/bin/bash
set -e

echo "🚀 Upgrading pip..."
python3 -m pip install --upgrade pip

echo "📦 Installing Python dependencies..."
pip install -r /workspaces/$(basename `git rev-parse --show-toplevel`)/requirements.txt