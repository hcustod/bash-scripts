#!/bin/bash

count_files_and_dirs() {
    local directory="$1" 
    local file_count=0
    local dir_count=0

    for item in "$directory"/*; do
        if [ -f "$item" ]; then
            ((file_count++))
        elif [ -d "$item" ]; then
            ((dir_count++))
        fi
    done

    echo "Files: $file_count"
    echo "Subdirectories: $dir_count"
}

read -p "Enter the directory to count: " target_dir

if [ ! -d "$target_dir" ]; then
    echo "Directory '$target_dir' does not exist."
    exit 1
fi

count_files_and_dirs "$target_dir"
