#!/usr/bin/env bash
set -euo pipefail

FILES_DIR="/app/web/sites/default/files"
ARCHIVE_URL="${FILES_TAR_URL:-}"

echo "Directorio de archivos: $FILES_DIR"
echo "URL del archivo: $ARCHIVE_URL"

# vaciar el directorio antes de poblar
rm -rf "$FILES_DIR"/*

mkdir -p "$FILES_DIR"

if [ -n "$ARCHIVE_URL" ]; then
  echo "Poblando $FILES_DIR desde $ARCHIVE_URL"

  TMP_ARCHIVE="/tmp/files.tar.gz"
  curl -SL -o "$TMP_ARCHIVE" "$ARCHIVE_URL"

  tar -xzf "$TMP_ARCHIVE" -C "$FILES_DIR"
  rm -f "$TMP_ARCHIVE"

  # permisos
  chown -R www-data:www-data "$FILES_DIR" 2>/dev/null || true
  chmod -R 775 "$FILES_DIR" || true

  echo "Poblado completado."
else
  echo "ARCHIVE_URL no proporcionado, no se hace nada."
fi