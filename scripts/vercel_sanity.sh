#!/usr/bin/env bash
# Simple sanity checks for Vercel preview deployments.
# Usage: scripts/vercel_sanity.sh https://<preview-domain>.vercel.app
set -euo pipefail

BASE_URL="${1:-}"
if [[ -z "$BASE_URL" ]]; then
  echo "Usage: $0 https://<preview-domain>.vercel.app"
  exit 2
fi

fail=0

echo "==> Checking redirect /old -> /new (308)…"
# Fetch only headers (-I). Capture status and Location.
code=$(curl -s -o /dev/null -w "%{http_code}" -I "$BASE_URL/old")
loc=$(curl -s -I "$BASE_URL/old" | tr -d '\r' | awk -F': ' 'tolower($1)=="location"{print $2; exit}')
if [[ "$code" != "308" ]]; then
  echo "Redirect check FAILED: expected 308, got $code"
  fail=1
else
  echo "Redirect status OK: $code"
fi
if [[ "$loc" != "/new" && "$loc" != "$BASE_URL/new" ]]; then
  echo "Redirect Location FAILED: expected /new (or absolute), got '$loc'"
  fail=1
else
  echo "Redirect Location OK: $loc"
fi

echo "==> Checking SPA fallback for /some/deep/link …"
code=$(curl -s -o /dev/null -w "%{http_code}" "$BASE_URL/some/deep/link")
ctype=$(curl -s -I "$BASE_URL/some/deep/link" | tr -d '\r' | awk -F': ' 'tolower($1)=="content-type"{print $2; exit}')
if [[ "$code" != "200" ]]; then
  echo "SPA fallback FAILED: expected 200, got $code"
  fail=1
else
  echo "SPA fallback OK: $code ($ctype)"
fi

echo "==> Checking a static asset /favicon.ico …"
code=$(curl -s -o /dev/null -w "%{http_code}" -I "$BASE_URL/favicon.ico")
if [[ "$code" != "200" && "$code" != "304" ]]; then
  echo "Asset check FAILED: expected 200/304, got $code"
  fail=1
else
  echo "Asset check OK: $code"
fi

echo "==> (Optional) API passthrough /api/health …"
api_code=$(curl -s -o /dev/null -w "%{http_code}" -I "$BASE_URL/api/health" || true)
echo "API /api/health returned: $api_code (info only)"

exit $fail
