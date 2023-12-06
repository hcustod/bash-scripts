#!/bin/bash

source_dir="$1"  #first argument is source dir.
backup_dir="$2"  #second argument. 

if [ -z "$source_dir" ] || [ -z "$backup_dir" ]; then
    echo "Usage: $0 <source_dir> <backup_dir>"
    exit 1   # return error. 
fi 

if [ ! -d "$source_dir" ]; then   # -d returns TRUE is file exists and is a directory. 
    echo "Error: Source directory does not exist"
    exit 1
fi 

mkdir -p "$backup_dir" #create backup directory if it doesn't exist

timestamp=$(date +%Y%m%d%H%M%S)
backup_file="$backup_dir/backup_$timestamp.tar.gz"

tar -czf "$backup_file" "$source_dir"

echo "Backup completed: $backup_file" 






