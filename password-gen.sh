#!/bin/bash

password_length=12

generate_password() {
    local length="$1"
    </dev/urandom tr -dc 'a-zA-Z0-9' | head -c "$length"
}

if [ $# -eq 1 ] && [[ "$1" =~ ^[0-9]+$ ]]; then
    password_length="$1"
fi

random_password=$(generate_password "$password_length")

echo "Random Password: $random_password"

