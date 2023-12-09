#!/bin/bash


function main_menu () {
    app_running=true
    while $app_running; 
    do
        echo "Welcome to my application, below are the available programs."
        echo "1/A) ... Triangular Numbers."
        echo "2/B) ... Product of Two Square Even Numbers."
        echo "3/C) ... Sequences of a Term."
        echo "4/D) ... Exit the program."

        read -p "Please select a choice by entering a corresponding number or letter: " user_menu_choice

        echo "You chose: $user_menu_choice"

        case $user_menu_choice in 
            A|a|1) 
                echo "task1" 
                ;;
            B|b|2) 
                echo "task2" 
                ;;
            C|c|3) 
                echo "task3" 
                ;;
            D|d|4) 
                echo "Exiting the application." 
                exit 0
                ;;
            *) 
                echo "Invalid selection. Please choose from the valid menu options.";;
        esac
    done
}



