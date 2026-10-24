#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
tmp="$(mktemp -d)"

cat > "$tmp/pgrep" <<'MOCK'
#!/usr/bin/env bash
[[ "$#" -eq 2 && "$1" == "-f" && "$2" == '[O]penCloud\.AppImage' ]] || exit 97
exit "${MOCK_PGREP_STATUS:-1}"
MOCK
chmod +x "$tmp/pgrep"

if ! bash -n "$ROOT/check.sh"; then
    echo "bash -n failed" >&2
    exit 1
fi

MOCK_PGREP_STATUS=0 PATH="$tmp:$PATH" bash "$ROOT/check.sh" >/dev/null
if MOCK_PGREP_STATUS=1 PATH="$tmp:$PATH" bash "$ROOT/check.sh" >/dev/null 2>&1; then
    echo "inactive process should return non-zero" >&2
    exit 1
fi
if MOCK_PGREP_STATUS=97 PATH="$tmp:$PATH" bash "$ROOT/check.sh" >/dev/null 2>&1; then
    echo "unexpected pgrep invocation should fail" >&2
    exit 1
fi
echo "PASS: active/inactive detection and exact pgrep pattern"
