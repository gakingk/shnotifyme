#!/bin/bash
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

SCRIPT="$1"
shift
bash "$SCRIPT_DIR/notify.sh" "$SCRIPT_DIR/wait.sh" "$SCRIPT" "$@"