#!/usr/bin/env bash
cd "$(dirname "$0")"
PORT="${PDF_PORT:-8777}"
if command -v xdg-open >/dev/null; then (sleep 1.5; xdg-open "http://localhost:$PORT") >/dev/null 2>&1 & fi
exec python3 -m http.server "$PORT"
