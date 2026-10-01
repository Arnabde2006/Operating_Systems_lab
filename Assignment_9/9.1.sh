#!/bin/sh
# Assignment 9.1 - Menu-driven script: date, current directory, list files, logged in users
while true
do
    echo "MENU"
    echo "1.Display today's date"
    echo "2.Show the current directory"
    echo "3. List all the files in the directory"
    echo "4. Show who is logged in"
    echo "5. Exit"
    echo "Enter your choice"
    read ch
    case $ch in
        1) date ;;
        2) pwd ;;
        3) ls ;;
        4) who ;;
        5) echo "Closing." ; break ;;
        6) echo "Invalid Choicee" ;;
    esac
done
