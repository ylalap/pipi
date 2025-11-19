#!/bin/bash

echo "=== Flutter Project Setup ==="

# Проверить, находимся ли мы в папке с Flutter проектом
if [ -f "pubspec.yaml" ]; then
    echo "✓ Flutter project found in current directory"
    CURRENT_DIR="."
else
    echo "✗ No Flutter project found. Creating new project..."
    flutter create auto_dealer_app
    cd auto_dealer_app
    CURRENT_DIR="."
fi

echo "=== Enabling Web Support ==="
flutter config --enable-web

echo "=== Installing Dependencies ==="
flutter pub get

echo "=== Creating Project Structure ==="
mkdir -p lib/screens lib/widgets lib/models lib/services lib/dialogs

echo "=== Creating Basic App ==="
cat > lib/main.dart << 'INNER_EOF'
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Auto Dealer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Auto Dealer App'),
      ),
      body: const Center(
        child: Text(
          'Welcome to Auto Dealer!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
INNER_EOF

echo "=== Starting Flutter Web Server ==="
flutter run -d web-server --web-port 3000
