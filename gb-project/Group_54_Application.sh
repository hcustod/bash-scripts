#!/bin/bash

# This code is organized into seperate functions for each task, and one for the main menu. 
# Within each function there is a submenu which will show after the function is completed, to return to the main menu.
# The start of the code is at the bottom of the script due to organization of function calls.

# --------- --------- Task 3: Terms of Sequence     --------- ---------

function task3_find_terms_of_sequence () {

    echo "-----------------------------------------------"
    echo "Welcome to Task 3: Finding Terms of a Sequence!"
    echo "-----------------------------------------------"
    read -p "Enter an integer for the value of a: " user_val1 
    read -p "Enter an integer for the value of b: " user_val2

    echo "You have the following choices for this sequence:" 
    echo "1/A) ... Find a limited number of terms in the sequence. User specifies max."
    echo "2/B) ... Find term in given position. Determine if it is a factor of another term."

    task_running=true

    while $task_running; 
    do

        read -p "Please choose an option: " user_task3_choice
        echo "You chose: " $user_task3_choice

        case $user_task3_choice in
            1|A|a) 
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

            2|B|b) 
                read -p "Enter the term position to find: " term_position
                read -p "Enter an integer to check if term is a factor of it: : " factor_check_num

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

        echo "-----------------------"
        echo "--- Task Completed! ---" 
        echo "-----------------------"
        echo "Would you now like to: "
        echo "1/A) ... Perform same task."
        echo "2/B) ... Return to the Main Menu."
        echo "3/C) ... Exit the Application."

        endtask_running=true
        while $endtask_running;
        do

            read -p "Please select now: " user_end_choice

            case $user_end_choice in
                1|A|a)
                    echo "Returning to top of task...."
                    task3_find_terms_of_sequence
                    endtask_running=false
                    break
                    ;;
                2|B|b)
                    echo "Returning to the main menu...."
                    sleep 1
                    main_menu
                    endtask_running=false
                    task_running=false
                    break
                    ;;
                3|C|c)
                    echo "Exiting application. Goodbye!"
                    exit 0
                    ;;
            esac
        done
    done
}


# --------- --------- Task 2: Even square products  --------- ---------

function task2_find_product_of_even_squares () {

    echo "------------------------------------------------"
    echo "Welcome to Task 2: Finding Even Square Products!"
    echo "------------------------------------------------"
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

    echo "-----------------------"
    echo "--- Task Completed! ---" 
    echo "-----------------------"
    echo "Would you now like to: "
    echo "1/A) ... Perform same task."
    echo "2/B) ... Return to the Main Menu."
    echo "3/C) ... Exit the Application."

    endtask_running=true
    while $endtask_running;
    do

        read -p "Please select now: " user_end_choice

        case $user_end_choice in
            1|A|a)
                echo "Returning to top of task...."
                task2_find_product_of_even_squares
                endtask_running=false
                break
                ;;
            2|B|b)
                echo "Returning to the main menu...."
                sleep 1
                main_menu
                endtask_running=false
                task_running=false
                break
                ;;
            3|C|c)
                echo "Exiting application. Goodbye!"
                exit 0
                ;;
        esac
    done
}


# --------- --------- Task 1: Triangle Nums         --------- ---------

function task1_triangle_num_calc () {

    echo "------------------------------------------------"
    echo "Welcome to Task 1: A Triangle Number Calculator!"
    echo "------------------------------------------------"

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

    echo "Total Triangular Numbers: $total_triangles"
    echo "Total Multiples of 3: $total_multiples_of_3"

    echo "-----------------------"
    echo "--- Task Completed! ---" 
    echo "-----------------------"
    echo "Would you now like to: "
    echo "1/A) ... Perform same task."
    echo "2/B) ... Return to the Main Menu."
    echo "3/C) ... Exit the Application."

    endtask_running=true
    while $endtask_running;
    do
    
        read -p "Please select now: " user_end_choice

        case $user_end_choice in
            1|A|a)
                echo "Returning to top of task...."
                task1_triangle_num_calc
                endtask_running=false
                break
                ;;
            2|B|b)
                echo "Returning to the main menu...."
                sleep 1
                main_menu
                endtask_running=false
                task_running=false
                break
                ;;
            3|C|c)
                echo "Exiting application. Goodbye!"
                exit 0
                ;;
        esac
    done
}



# --------- --------- Main Menu           --------- --------- ---------

function main_menu () {

    clear 

    app_running=true

    echo "You are at the Main Menu $USER_NAME, below are the available programs: "
    echo "1/A) ... Task1: Triangular Numbers."
    echo "2/B) ... Task2: Product of Two Square Even Numbers."
    echo "3/C) ... Task3: Sequences of a Term."
    echo "4/D) ... Exit the program."

    while $app_running; 
    do

        read -p "Please select a choice by entering a corresponding number or letter: " user_menu_choice
        echo "You chose: $user_menu_choice"

        case $user_menu_choice in 
            A|a|1) 
                task1_triangle_num_calc
                break
                ;;
            B|b|2) 
                task2_find_product_of_even_squares 
                break
                ;;
            C|c|3) 
                task3_find_terms_of_sequence
                break 
                ;;
            D|d|4) 
                echo "Exiting the application. Goodbye!" 
                exit 0
                ;;
            *) 
                echo "ERROR: Invalid selection. Please enter a valid option.";;
        esac
    done
}



# --------- --------- Script start        --------- --------- ---------

read -p "Please enter your name: " USER_NAME

echo "------------------------------------------------------------------------"
echo "------------------------------------------------------------------------"
echo "Hello $USER_NAME, Welcome to this application made by Henrique Custodio!"
echo "------------------------------------------------------------------------"
echo "------------------------------------------------------------------------"
echo "Select by entering an corresponding letter or number: "
echo "1/A) ... Continue: Enter Application"
echo "2/B) ... Exit: Close Application"

app_running=true

while $app_running; 
do

    read -p "Please enter an option: " user_choice1


    case $user_choice1 in
        1|A|a) 
            # User choice cant be seen as call to menu function happens too quickly. But presenting main menu clearly seems more important.
            # Later menus allows user to more clearly see their choice." 
            echo "You chose: $user_choice1"
            sleep 1
            main_menu $USER_NAME
            break
            ;;
        2|B|b)
            echo "You chose: $user_choice1" 
            echo "Exiting the application. Goodbye!"
            exit 0
            ;;
        *)
            echo "You chose: $user_choice1" 
            echo "ERROR: Invalid selection. Please enter a valid option."
    esac

done


