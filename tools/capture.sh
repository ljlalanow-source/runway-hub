#!/usr/bin/env bash
# Screenshot a local HTML file (or a URL) into a 4:3 PNG for the hub card. (macOS / Linux)
# Usage:  bash tools/capture.sh work/01-example/index.html thumbs/01-example.png
set -e
TARGET="$1"; OUT="$2"; W="${3:-1200}"; H="${4:-900}"
[ -z "$TARGET" ] || [ -z "$OUT" ] && { echo "usage: capture.sh <html-or-url> <out.png>"; exit 1; }

for b in \
  "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" \
  "/Applications/Microsoft Edge.app/Contents/MacOS/Microsoft Edge" \
  "$(command -v google-chrome || true)" "$(command -v chromium || true)" "$(command -v chromium-browser || true)"; do
  [ -n "$b" ] && [ -x "$b" ] && BROWSER="$b" && break
done
[ -z "$BROWSER" ] && { echo "Chrome or Edge not found."; exit 1; }

if [ -f "$TARGET" ]; then URI="file://$(cd "$(dirname "$TARGET")" && pwd)/$(basename "$TARGET")"; else URI="$TARGET"; fi
mkdir -p "$(dirname "$OUT")"
"$BROWSER" --headless=new --disable-gpu --hide-scrollbars --no-first-run --virtual-time-budget=4000 \
  --window-size="$W,$H" --screenshot="$(cd "$(dirname "$OUT")" && pwd)/$(basename "$OUT")" "$URI" >/dev/null 2>&1
[ -f "$OUT" ] && echo "saved: $OUT" || { echo "screenshot failed"; exit 1; }
