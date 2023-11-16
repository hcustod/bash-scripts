#!/bin/bash

validate_input() {
    if [[ $# -ne 2 ]] || ! [[ "$1" =~ ^[1-9][0-9]*$ && "$2" =~ ^[1-9][0-9]*$ ]]; then
        echo "Please provide 2 valid numeric arguments."
        exit 1
    else
        return 0
    fi
}


while true; do
    read -p "Please enter two positive values: " user_input1 user_input2

    if validate_input $user_input1 $user_input2 ; then
        let user_input1=user_input1+1
        let user_input2=user_input2+1

        echo $user_input1 $user_input2
        break
    else
        echo "There was an uncaught issue."
    fi
done

echo "Scipt finished without issue!"
