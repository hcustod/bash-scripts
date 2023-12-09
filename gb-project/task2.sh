#!/bin/bash

function task2_find_product_of_even_squares () {

    read -p "Enter the number of products of even squares to be printed: " user_num_input

    local total_products_found=0
    local start=2                   # starting square. Must be outside of while loop else variable resets every iteration. 

    while [ $total_products_found != $user_num_input ]
    do

        local num1_square=$(($start*$start))
        local num2_square=$((($start+2)*($start+2)))

        local product=$(($num1_square * $num2_square))

        total_products_found=$(($total_products_found + 1))
        start=$(($start + 2))

        if [ $(($product % 2)) == 0 ];
        then
            echo "$product (even)"
        else
            echo "$product (odd)"
        fi
    done 

    echo "--- Task Completed! ---" 
    echo "Would you now like to: "
    echo "1) ... Perform same task."
    echo "2) ... Return to the Main Menu."
    echo "3) ... Exit the Application."

    endtask_running=true
    while $endtask_running;
    do

        read -p "Please select now (1,2, 3): " user_end_choice

        case $user_end_choice in
            1)
                echo "Returning to top of task...."
                endtask_running=false
                ;;
            2)
                echo "Returning to the main menu...."
                main_menu
                endtask_running=false
                task_running=false
                ;;
            3)
                echo "Exiting application....Goodbye!"
                exit 0
                ;;
        esac
    done
}

task2_find_product_of_even_squares