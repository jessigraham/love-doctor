#!/bin/sh
# index.html is authored as an artifact body (no doctype/head); wrap it in a full document for static hosting
set -e
mkdir -p dist
{
  printf '%s' '<!doctype html><html lang="en"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover"><style>:root{color-scheme:light;padding-top:env(safe-area-inset-top,0px);padding-bottom:env(safe-area-inset-bottom,0px)}body{margin:0;font:14px system-ui,-apple-system,sans-serif}img{max-width:100%}[hidden]{display:none!important}</style></head><body>'
  cat index.html
  printf '%s' '</body></html>'
} > dist/index.html
