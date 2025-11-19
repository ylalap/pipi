#!/bin/bash

echo "Starting Auto Dealer Application..."

# Запуск ASP.NET Core API в фоне
echo "Starting ASP.NET Core API..."
cd api
dotnet run &
API_PID=$!

# Ждем запуска API
sleep 10

# Запуск Flutter приложения
echo "Starting Flutter Web App..."
cd ../flutter_app
flutter run -d web-server --web-port 3000 --web-hostname 0.0.0.0

# При завершении убиваем процессы
kill $API_PID