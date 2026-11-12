#!/bin/sh
# index.html is authored as an artifact body (no doctype/head); wrap it in a full document for static hosting
set -e
mkdir -p dist
ICON='data:image/svg+xml,%3Csvg xmlns=%22http://www.w3.org/2000/svg%22 viewBox=%220 0 32 32%22%3E%3Crect width=%2232%22 height=%2232%22 rx=%227%22 fill=%22%2315111a%22/%3E%3Cpath d=%22M3 18h7l3-9 4 15 3-10 2 4h7%22 fill=%22none%22 stroke=%22%23ff4d6d%22 stroke-width=%222.6%22 stroke-linecap=%22round%22 stroke-linejoin=%22round%22/%3E%3C/svg%3E'
{
  printf '%s' '<!doctype html><html lang="en"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover">'
  printf '%s' '<meta name="description" content="A five-minute journey through your attachment style, who you pair best with, the cycles couples get stuck in, and how to make it work.">'
  printf '%s' '<meta name="theme-color" content="#f2f0f3" media="(prefers-color-scheme: light)"><meta name="theme-color" content="#0f0d12" media="(prefers-color-scheme: dark)">'
  printf '%s' '<meta name="apple-mobile-web-app-title" content="Love Doctor"><meta name="format-detection" content="telephone=no">'
  printf '%s' "<link rel=\"icon\" href=\"$ICON\"><link rel=\"apple-touch-icon\" href=\"$ICON\">"
  printf '%s' '<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>'
  printf '%s' '<style>:root{color-scheme:light dark;padding-top:env(safe-area-inset-top,0px);padding-bottom:env(safe-area-inset-bottom,0px)}body{margin:0;font:14px system-ui,-apple-system,sans-serif}img{max-width:100%}[hidden]{display:none!important}</style></head><body>'
  cat index.html
  printf '%s' '</body></html>'
} > dist/index.html
