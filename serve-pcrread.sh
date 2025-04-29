#!/bin/bash -eu

report_dir="$SNAP_COMMON/report"
mkdir -p "$report_dir"
PORT="${LISTENING_PORT:-80}"

tpm2_pcrread sha256 > "$report_dir/pcr"
tpm2_pcrread sha256:13 > "$report_dir/pcr13"

python3 -m http.server -d "$report_dir" $PORT
