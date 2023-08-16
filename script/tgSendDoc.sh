#!/bin/bash

set -euo pipefail

TOKEN=${TELEGRAM_TOKEN}
CHAT_ID=${TELEGRAM_TO}

for arg in "$@"
do
    curl -X POST \
    -H "content-type: multipart/form-data" \
    -F document=@"$arg" \
    -F chat_id=$CHAT_ID \
    https://api.telegram.org/bot$TOKEN/sendDocument
done