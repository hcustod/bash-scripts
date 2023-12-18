#!/bin/bash

# This script creates a basic file management program on the terminal. 

create_file() {
    while true; do 
        echo "-----------------------------"
        echo "------- CREATE A FILE -------"
        echo "-----------------------------"
        read -p "Enter a name for the new file: " file_name

        if [$filename]; then
            echo "File $file_name already exists."
        else
            touch $file_name
            echo "$file_name was created successfully."
        fi

        done_menu

    done
}


list_files() {
    echo "-----------------------------"
    echo "-------- FILE LISTING -------"
    echo "-----------------------------"
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


done_menu() {
    while true; do
        echo "All tasks completed."
        echo "Would you now like to: "
        echo "1) Run the same task again.  "
        echo "2) Return to the main menu. "
        echo "3) Exit the program " 

        read -p "Enter your choice now: " user_endchoice

    done

}



# ----- Main Menu ------- 

while true; do
    echo "-----------------------------"
    echo "--------- Main Menu ---------"
    echo "-----------------------------"
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

