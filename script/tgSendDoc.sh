#!/bin/bash

set -euo pipefail

TOKEN=${TELEGRAM_TOKEN}
CHAT_ID=${TELEGRAM_TO}
# https://core.telegram.org/bots/api#senddocument
main(){
  local FILE=$1
  local MSG=$2
  curl -X POST \
    -H "content-type: multipart/form-data" \
    -F document=@"$FILE" \
    -F chat_id=$CHAT_ID \
    -F caption=$MSG \
    -F parse_mode=Markdown \
    https://api.telegram.org/bot$TOKEN/sendDocument
}

main $1 $2
