#!/bin/bash
# LinkedIn AIHawk - AI-powered job application bot
# Automates LinkedIn job applications using AI

PORT=${PORT:-50011}

echo "🤖 Starting LinkedIn AIHawk on port $PORT..."

# Check if Python is available
if ! command -v python3 &> /dev/null; then
    echo "❌ Error: Python 3 is not installed"
    exit 1
fi

# Create virtual environment if it doesn't exist
if [ ! -d ".env" ]; then
    echo "📦 Creating virtual environment..."
    python3 -m venv .env || {
        echo "❌ Failed to create virtual environment"
        exit 1
    }
fi

# Activate virtual environment
if [ -f ".env/bin/activate" ]; then
    source .env/bin/activate
else
    echo "❌ Error: Virtual environment activation script not found"
    exit 1
fi

# Install dependencies
if [ -f "requirements.txt" ]; then
    echo "📦 Installing dependencies..."
    pip install -q -r requirements.txt 2>&1 || {
        echo "⚠️  Warning: Some dependencies may have failed to install"
    }
fi

# Check if config files exist
if [ ! -d "data_folder" ]; then
    echo "⚠️  Warning: data_folder not found. Please copy data_folder_example to data_folder and configure."
    echo "   See README_GEMAPPS.md for setup instructions."
    exit 1
fi

# Run the main script
echo "✅ LinkedIn AIHawk is running"
echo "⚠️  NOTE: This tool requires configuration in data_folder/"
echo "   Please ensure you have set up config.yaml and secrets.yaml"

python3 main.py

