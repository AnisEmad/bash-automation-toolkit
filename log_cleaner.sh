#!/usr/bin/env bash

set -euo pipefail

#using this path if you will schudle it using cron 
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
LOG_DIR="${1:-./}" #change this to your path 
ARCHIVE_DIR="$LOG_DIR/archive/"

#making a dir for archive if it isn't there 
mkdir -p "$ARCHIVE_DIR"


#finding all .log files even with werid characters and spacing 
find "$LOG_DIR" -maxdepth 1 -name "*.log" -print0 | while IFS= read -r -d '' file; do 
    
    #checks if it's a regular file
    [[ -f "$file" ]] || continue 

    #calcuating the age of the file 
    creation_time=$(stat -c %Y "$file")
    time_now=$(date +%s)
    differnce=$(( (time_now - creation_time) / 86400 ))

    # if it's 30 days it will be deleted if it's 3 or more will be compressed
    if (( differnce >= 30 )); then
        echo "we are deleting this file '$file'"
        rm "$file"
    elif (( differnce >= 3 )); then
        echo "we are compressing this file $file"
        gzip "$file"
        #moving it to the archive dir 
        mv "${file}.gz" "$ARCHIVE_DIR"
    fi
done
