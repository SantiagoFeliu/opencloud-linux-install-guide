#!/usr/bin/env bash
set -euo pipefail

if pgrep -f '[O]penCloud\.AppImage' >/dev/null; then
    echo "OpenCloud process detected"
else
    echo "OpenCloud process not running" >&2
    exit 1
fi
