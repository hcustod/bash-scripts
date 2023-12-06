#!/bin/bash

source_file="$1"
dir_to_be_created="$2"

if [ -z "$source_file" ] || [ $# -lt 2]; then
    echo "Usage: ./backup-opener.sh <source_file> <dir_to_be_created> - Source file can be .tar, .gz, or both."
    exit 1
fi 

if [ ! -e "$source_file" ]; then 
    echo "Error: file does not exist"
    exit 1
fi

mkdir -p "$dir_to_be_created"

tar -xvf "$source_file" -C "./$dir_to_be_created"

gunzip -c "$source_file" > "./$dir_to_be_created"

echo "Extraction completed. Contents are in $dir_to_be_created."



