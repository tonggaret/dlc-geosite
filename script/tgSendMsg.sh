#!/bin/bash

set -euo pipefail

TOKEN=${TELEGRAM_TOKEN}
CHAT_ID=${TELEGRAM_TO}

tgSendMsg(){
    curl -s -X POST "https://api.telegram.org/bot$TOKEN/sendMessage" -d chat_id="$CHAT_ID" \
    -d parse_mode=Markdown \
    -d text="${1}" \
    -d disable_web_page_preview=true
}

tgSendMsg "$@"