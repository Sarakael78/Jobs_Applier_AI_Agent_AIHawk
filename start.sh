#!/bin/bash
# LinkedIn AIHawk - AI-powered job application bot
# Automates LinkedIn job applications using AI

set -e

echo "🤖 Starting LinkedIn AIHawk..."
echo ""

# Set port from environment or default
export PORT=${PORT:-50011}
echo "📡 Using port: $PORT"

# Check for orphaned processes
echo "🔎 Checking for orphaned processes..."
CLEANED=false

# Kill old Python processes for this app
if pgrep -f "python.*main.py.*linkedIn" > /dev/null 2>&1; then
    echo "⚠️  Killing orphaned LinkedIn AIHawk processes..."
    pkill -f "python.*main.py.*linkedIn"
    CLEANED=true
fi

# Kill processes on the port
PIDS=$(lsof -ti:$PORT 2>/dev/null || true)
if [ -n "$PIDS" ]; then
    echo "⚠️  Port $PORT is busy. Stopping process(es): $PIDS"
    echo "$PIDS" | xargs -r kill -9 2>/dev/null || true
    CLEANED=true
fi

if [ "$CLEANED" = true ]; then
    echo "✅ Cleaned up orphaned processes"
    sleep 1
else
    echo "✅ No orphaned processes found"
fi

echo ""

# Check if Python is available
if ! command -v python3 &> /dev/null; then
    echo "❌ Error: Python 3 is not installed"
    exit 1
fi

echo "✅ Python version: $(python3 --version)"
echo ""

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
    echo "🔧 Activating virtual environment..."
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

# Check if main script exists
if [ ! -f "main.py" ]; then
    echo "❌ Error: main.py not found!"
    exit 1
fi

echo ""
echo "🔥 Launching LinkedIn AIHawk..."
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "⚠️  NOTE: This tool requires configuration in data_folder/"
echo "   Please ensure you have set up config.yaml and secrets.yaml"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

# Run the main script
python3 main.py

