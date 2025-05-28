#!/bin/bash
set -e

# Конфигурация
APP_NAME="moviemap"
CONTAINER_NAME="${APP_NAME}_prod"
PORT=8000
echo $(pwd)
BACKEND_DIR="Moviemap_back_result"

cd "$BACKEND_DIR"
# 1. Установка gdown и загрузка файлов (если нужно)
if [ ! -d "data" ]; then
  echo "📁 Создаём папку data..."
  mkdir -p data
fi

echo "📦 Устанавливаем gdown..."
pip install --no-cache-dir gdown || true

echo "📥 Запускаем загрузку данных..."
python download_files.py

# 2. Остановка старого контейнера
echo "🧹 Проверяем наличие старого контейнера..."
if docker ps -a | grep -q "$CONTAINER_NAME"; then
  echo "⏳ Останавливаем и удаляем старый контейнер..."
  docker stop "$CONTAINER_NAME" || true
  docker rm "$CONTAINER_NAME" || true
fi

# 3. Сборка образа
echo "📦 Собираем Docker-образ..."
DOCKER_BUILDKIT=0 docker build -t "$APP_NAME" .

# 4. Запуск контейнера
echo "🚀 Запускаем контейнер..."
docker run -d \
  --name "$CONTAINER_NAME" \
  -p "$PORT:$PORT" \
  "$APP_NAME"
