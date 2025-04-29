#!/bin/bash -eu

report_dir="$SNAP_COMMON/report"
mkdir -p "$report_dir"
PORT="${LISTENING_PORT:-80}"

tpm2_pcrread > "$report_dir/pcr"

python3 -m http.server -d "$report_dir" $PORT
