#!/usr/bin/env bash
set -euo pipefail

FILES_DIR="/app/web/sites/default/files"
ARCHIVE_URL="${FILES_TAR_URL:-}"        # lo pasaremos como variable de entorno en Railway
ARCHIVE_AUTH="${FILES_TAR_AUTH:-}"      # opcional: token para autorización (Bearer)

# Asegurarse que el dir exista
mkdir -p "$FILES_DIR"

# Si el directorio está vacío, poblarlo desde ARCHIVE_URL
if [ -n "$ARCHIVE_URL" ] && [ -z "$(ls -A "$FILES_DIR")" ]; then
  echo "Files dir vacío: poblando desde $ARCHIVE_URL"

  TMP_ARCHIVE="/tmp/files.tar.gz"
  if [ -n "$ARCHIVE_AUTH" ]; then
    # ejemplo con header Authorization: Bearer <token>
    curl -SL -H "Authorization: Bearer $ARCHIVE_AUTH" -o "$TMP_ARCHIVE" "$ARCHIVE_URL"
  else
    curl -SL -o "$TMP_ARCHIVE" "$ARCHIVE_URL"
  fi

  tar -xzf "$TMP_ARCHIVE" -C "$FILES_DIR"
  rm -f "$TMP_ARCHIVE"

  # Ajustar permisos (intenta con www-data, si falla, no abortes)
  chown -R www-data:www-data "$FILES_DIR" 2>/dev/null || true
  chmod -R 775 "$FILES_DIR" || true

  echo "Poblado completado."
else
  echo "Files dir ya contiene datos o no se proporcionó ARCHIVE_URL; no se hace nada."
fi

# Finalmente, arrancar el servidor (ajusta la línea según tu start real)
exec php -S 0.0.0.0:$PORT -t web
