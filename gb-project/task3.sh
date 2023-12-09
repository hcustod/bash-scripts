#!/bin/bash

function task3_find_terms_of_sequence () {

    read -p "Enter an integer for the value of a: " user_val1 
    read -p "Enter an integer for the value of b: " user_val2

    echo "You have the following choices for this sequence:" 
    echo "1) Find a limited number of terms in the sequence. Terms and sum will be printed up to user specified max (int)."
    echo "2) Find a specific term in a position(int) and determine if it is a factor of another term(int)."

    task_running=true

    while $task_running; 
    do

        read -p "Please choose an option (1 or 2): " user_task3_choice

        case $user_task3_choice in
            1) 
                echo "You chose: 1) Find a limited number of terms in the sequence."
                read -p "Please provide a limit (maximum) for terms to be found in the sequence: " seq_max

                sum=0
                
                for (( i=1; i<=$seq_max; i++));
                do
                    sequence=$(($user_val1 * $i**3 + $user_val2 * $i))
                    echo $sequence

                    sum=$(($sum+$sequence))
                done

                echo "The sum of terms in the given sequence is: $sum"
                ;;

            2) 
                echo "You chose: 2) Find a specific term in a position(int) & check factor(int)."

                read -p "Please enter the term position you'd like to find: " term_position
                read -p "Please enter another integer to check if the produced term will be a factor of it: " factor_check_num

                sequence=$(($user_val1 * $term_position**3 + $user_val2 * $term_position))

                if (($factor_check_num % $sequence == 0));
                then
                    echo "The given term $term_position is $sequence. This term is a factor of $factor_check_num"
                else
                    echo "The given term $term_position is $sequence. This term is NOT a factor of $factor_check_num"
                fi
                ;;
            *)
                echo "Invalid option: Must be either 1 or 2."
                ;;
        esac

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
    done
}

task3_find_terms_of_sequence