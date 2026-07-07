#!/bin/bash

required=18000      # MB of free VRAM required
stable_seconds=30
ok=0

SCRIPT="$1"
shift

if [ -z "$SCRIPT" ]; then
    echo "Usage: $0 <script>"
    exit 1
fi

while (( ok < stable_seconds )); do
    available=$(nvidia-smi --query-gpu=memory.free --format=csv,noheader,nounits | head -n1)

    if (( available >= required )); then
        ((ok++))
    else
        ok=0
    fi

    printf "\rFree VRAM: %5d MB | Stable: %2d/%d" "$available" "$ok" "$stable_seconds"

    sleep 1
done

echo
echo "Starting $SCRIPT..."

bash "$SCRIPT" "$@"