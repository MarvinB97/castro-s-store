#!/bin/sh
set -e

echo '⏳ Esperando conexión a la base de datos...'
sleep 10

echo '✅ Importando configuración con drush cim -y...'
./vendor/bin/drush cim -y || true

echo '♻️ Limpiando caché...'
./vendor/bin/drush cr || true

echo '🚀 Iniciando servidor Drupal...'
php -d memory_limit=512M -S 0.0.0.0:${PORT:-8080} -t web
