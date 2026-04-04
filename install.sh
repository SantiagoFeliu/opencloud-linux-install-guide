#!/usr/bin/env bash
set -e

mkdir -p ~/.local/bin ~/.local/share/applications

APP=$(find . -maxdepth 1 -iname "*opencloud*.AppImage" | head -n 1)

if [ -z "$APP" ]; then
  echo "Falta AppImage de OpenCloud en esta carpeta"
  exit 1
fi

cp "$APP" ~/.local/bin/OpenCloud.AppImage
chmod +x ~/.local/bin/OpenCloud.AppImage

cat > ~/.local/share/applications/opencloud.desktop <<DESKTOP
[Desktop Entry]
Name=OpenCloud
Exec=%h/.local/bin/OpenCloud.AppImage
Type=Application
Terminal=false
DESKTOP

echo "Instalado"
