#!/bin/bash

password_file="./passwords"

encrypt_password() {
    read -s -p "Enter the password: " password
    echo
    openssl enc -aes-256-cbc -base64 -in <(echo -n "$password") -out "$password_file"
    echo "Password encrypted and saved." 
}

decrypt_password() {
    if [ ! -e "$password_file" ]; then
        echo "Password file does not exist."
        exit 1
    fi
    echo "Decrypted password: $password"
}

# Main menu
while true; do
    echo "Password Manager"
    echo "1. Store Password"
    echo "2. Retrieve Password"
    echo "3. Exit"
    read -p "Select an option (1/2/3): " choice
    case "$choice" in
        1) 
            encrypt_password
            ;;
        2)
            decrypt_password
            ;;
        3)
            echo "Exiting Password Manager."
            exit 0
            ;;
        *) 
            echo "Invalid option. Please choose 1, 2, or 3."
            ;;
    esac
done
