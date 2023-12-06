#!/bin/bash

generate_random_number() {
    local min="$1"
    local max="$2"
}

# get input from user
read -p "Enter the minimum number: " min_num
read -p "Enter the maximum number: " max_num


# check if the inputs are valid ints
if [[ ! "$min_num" =~ ^[0-9]+$ || ! "$max_num" =- ^[0-9]+$]]; then
    echo "Invalid input. Enter valid integers."
    exit 1
fi

if [ "$min_num" -gt "$max_num" ]; then
    echo "Min number must be less than or equal to the max number."
    exit 1
fi

random_num=$(generate_random_number "$min_num" "$max_num")

echo "Random number between $min_num and $max_num: $random_num"
