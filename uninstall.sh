#!/usr/bin/env bash
pkill -f OpenCloud.AppImage || true
rm -f ~/.local/bin/OpenCloud.AppImage
rm -f ~/.local/share/applications/opencloud.desktop
echo "Removed"
