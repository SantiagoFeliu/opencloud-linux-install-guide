#!/usr/bin/env bash
set -euo pipefail
for script in install.sh start.sh stop.sh check.sh uninstall.sh; do
  bash -n "$script"
done
tmp="$(mktemp -d)"
trap 'rm -rf "$tmp"' EXIT
cp install.sh "$tmp/"
(
  cd "$tmp"
  if HOME="$tmp/home" bash install.sh >"$tmp/output" 2>&1; then
    echo "FAIL: install without AppImage must fail" >&2
    exit 1
  fi
  grep -q "Falta AppImage" "$tmp/output"
)
(
  cd "$tmp"
  mkdir -p "$tmp/home"
  printf '#!/bin/sh\nexit 0\n' > OpenCloud.AppImage
  HOME="$tmp/home" bash install.sh
  test -x "$tmp/home/.local/bin/OpenCloud.AppImage"
  grep -Fx "Exec=$tmp/home/.local/bin/OpenCloud.AppImage" "$tmp/home/.local/share/applications/opencloud.desktop"
  HOME="$tmp/home" bash install.sh
  test -x "$tmp/home/.local/bin/OpenCloud.AppImage"
)
echo "PASS: syntax, missing AppImage, install and reinstall"
