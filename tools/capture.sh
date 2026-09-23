#!/usr/bin/env bash
# Screenshot a local HTML file (or a URL) into a PNG for the hub card, optionally cropping. (macOS / Linux)
# Usage:  bash tools/capture.sh <html-or-url> <out.png> [width] [height] [cropX cropY cropW cropH]
# Profile card (fixed angle, hero only, 3:2):
#   bash tools/capture.sh work/01-profile/index.html thumbs/01-profile.png 960 640 24 100 720 480
set -e
TARGET="$1"; OUT="$2"; W="${3:-1200}"; H="${4:-800}"
CX="$5"; CY="$6"; CW="$7"; CH="$8"
[ -z "$TARGET" ] || [ -z "$OUT" ] && { echo "usage: capture.sh <html-or-url> <out.png> [w h] [x y w h]"; exit 1; }

for b in \
  "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" \
  "/Applications/Microsoft Edge.app/Contents/MacOS/Microsoft Edge" \
  "$(command -v google-chrome || true)" "$(command -v chromium || true)" "$(command -v chromium-browser || true)"; do
  [ -n "$b" ] && [ -x "$b" ] && BROWSER="$b" && break
done
[ -z "$BROWSER" ] && { echo "Chrome or Edge not found."; exit 1; }

if [ -f "$TARGET" ]; then URI="file://$(cd "$(dirname "$TARGET")" && pwd)/$(basename "$TARGET")"; else URI="$TARGET"; fi
mkdir -p "$(dirname "$OUT")"
OUTABS="$(cd "$(dirname "$OUT")" && pwd)/$(basename "$OUT")"
"$BROWSER" --headless=new --disable-gpu --hide-scrollbars --no-first-run --virtual-time-budget=4000 \
  --window-size="$W,$H" --screenshot="$OUTABS" "$URI" >/dev/null 2>&1
[ -f "$OUTABS" ] || { echo "screenshot failed"; exit 1; }

# Optional crop: sips on macOS, ImageMagick elsewhere
if [ -n "$CW" ] && [ -n "$CH" ]; then
  if command -v sips >/dev/null 2>&1; then
    sips -c "$CH" "$CW" --cropOffset "$CY" "$CX" "$OUTABS" >/dev/null
  elif command -v convert >/dev/null 2>&1; then
    convert "$OUTABS" -crop "${CW}x${CH}+${CX}+${CY}" +repage "$OUTABS"
  else
    echo "crop skipped: no sips/convert"
  fi
fi
echo "saved: $OUTABS"
