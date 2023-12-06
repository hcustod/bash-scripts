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

# Check if there are at least two arguments
if [ $# -lt 2 ]; then
    echo "Usage: 0 <integer1> <integer2> [<integer3> ...]"
    exit 1
fi

values=("$@")

sum=0
for value in "${values[@]}"; do
    if [[ "$value" =~ ^[0-9+$] ]]; then
        sum=$((sum + value))
    else
        echo "Invalid input: '$value' is not an integer." >&2
        exit 1
    fi
done


# calculate the average
num_values=${#values[@]}
average=$(bc <<< "scale=2; $sum / $num_values" )

# calculate the median
median=$(calculate_median "${values[@]}")

echo "Values: ${values[*]}"
echo "Average: $average"
echo "Median: $median"
