#!/bin/bash

# This script creates a basic file management program on the terminal. 

create_file() {
    read -p "Enter the new file name: " file_name

    if [$filename]; then
        echo "File $file_name already exists."
    else
        touch $file_name
        echo "$file_name was created."
    fi
}


list_files() {
    echo "Files in the current directory: "
    ls -lhtra
}


delete_files() {
    echo "Enter the name of the file to delete: "
    read filename

    if [ -e $file_name ]; then
        rm -i $file_name
        echo "File $file_name deleted successfully."
    else
        echo "File $file_name not found."
    fi
}

# ----- Main Menu ------- 

while true; do
    echo "File Managment Menu: "
    echo "1. Create a new file."
    echo "2. List files in the current directory. "
    echo "3. Delete a file."
    echo "4. Exit."

    read choice

    case $choice in
        1)
            create_file 
            ;;
        2)
            list_files
            ;;
        3)
            delete_files
            ;;
        4)
            echo "Exiting the program."
            exit 0
            ;;
        *)
            echo "Invalid choice. Please select a valid option."
            ;;
    esac
done

