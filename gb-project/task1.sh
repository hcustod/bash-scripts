#!/bin/bash

function task1_triangle_num_calc () {

    read -p "Please enter the start of the range: "  range_start
    read -p "Please enter the end of the range: "  range_end

    local total_triangles=0 
    local total_multiples_of_3=0

    # Iinitialize the triangle counter before use in while loop. 
    # Initialize n according to trinagle num formula before loop. 
    local triangle_num=0   
    local n=1

    #While Loop as I do not know where range will begin/end before user input.
    while (( $triangle_num <= $range_end ));   
    do 
        if (( $triangle_num >= $range_start ));
        then
            total_triangles=$(($total_triangles + 1))   

            if (( $triangle_num % 3 == 0 ));
            then 
                echo $triangle_num
                total_multiples_of_3=$(($total_multiples_of_3 + 1))
            fi
        fi

        n=$(($n+1))
        triangle_num=$(( $n * ($n + 1) / 2 ))
    done

    echo "Total Triangular Numbers in given range: $total_triangles"
    echo "Total Multiples of 3 in given range: $total_multiples_of_3"

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

task1_triangle_num_calc

