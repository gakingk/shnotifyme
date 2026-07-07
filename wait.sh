#!/bin/bash

required=8192
stable_seconds=30
ok=0

SCRIPT="$1"
shift

if [ -z "$SCRIPT" ]; then
    echo "Usage: $0 <script>"
    exit 1
fi

while (( ok < stable_seconds )); do
    available=$(awk '/MemAvailable:/ {print int($2/1024)}' /proc/meminfo)

    if (( available >= required )); then
        ((ok++))
    else
        ok=0
    fi

    sleep 1
done

bash "$SCRIPT" "$@"