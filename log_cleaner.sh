#!/usr/bin/env bash

set -euo pipefail

PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
LOG_DIR=$HOME/devopsroadmap/module2/
ARCHIVE_DIR="$LOG_DIR/archive/"

mkdir -p "$ARCHIVE_DIR"



find "$LOG_DIR" -maxdepth 1 -name "*.log" -print0 | while IFS= read -r -d '' file; do 
    # echo $file
    [[ -f $file ]] || continue 

    creation_time=$(stat -c %Y $file)
    time_now=$(date +%s)
    differnce=$(( (time_now - creation_time) / 86400 ))
    # echo $differnce
    if (( differnce >= 30 )); then
        echo "we are deleting this file '$file'"
        rm $file
    elif (( differnce >= 3 )); then
        echo "we are compressing this file $file"
        gzip $file
        if [[ ! -d "$ARCHIVE_DIR" ]]; then
            mkdir archive
        fi
        mv "${file}.gz" "$ARCHIVE_DIR"
    fi
done
