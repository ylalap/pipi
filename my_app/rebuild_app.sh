#!/bin/bash

echo "🚀 Rebuilding Auto Dealer App..."

cd /workspaces/pipi/my_app

# Clean everything
flutter clean
rm -rf build
rm -rf .dart_tool

# Reinstall dependencies
flutter pub get

# Create basic structure
mkdir -p lib/screens lib/widgets lib/models lib/services lib/dialogs

echo "✅ Project cleaned and ready"

# Build and run
echo "🌐 Building and starting app..."
flutter run -d web-server --web-port 3000 --web-hostname 0.0.0.0
