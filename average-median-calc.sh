#!/bin/bash

calculate_median() {
    local values=("$@")
    local num_values=${#values[@]}

    # sort the values
    IFS=$'\n' sorted=($(sort -n <<<"${values[*]}"))
    unset IFS

    # If the number of values is odd, return middle value.
    if ((num_values % 2 == 1)); then
        echo "${sorted[num_values / 2]}"
    else
    # If even amount of values, return average of middle two values. 
        local middle1="${sorted[num_values / 2 - 1]}"
        local middle2="${sorted[num_values / 2]}"
        echo "scale=2; ($middle1 + $middle2) / 2" | bc
    fi
}