#!/bin/bash

source credentials.sh

SCRIPT="$1"

if [ -z "$SCRIPT" ]; then
    echo "Usage: $0 <script.sh>"
    exit 1
fi

start=$(date +%s)

bash "$SCRIPT"
status=$?

end=$(date +%s)
elapsed=$((end - start))

printf -v elapsed_fmt "%02d:%02d:%02d" \
    $((elapsed / 3600)) \
    $(((elapsed % 3600) / 60)) \
    $((elapsed % 60))

python scripts/pynotify.py \
    --script "$(basename "$SCRIPT")" \
    --status "$status" \
    --elapsed "$elapsed_fmt"

exit "$status"
