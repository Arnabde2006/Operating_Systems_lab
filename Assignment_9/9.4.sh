#!/bin/sh
# Assignment 9.4 - Menu-driven Student database
year=2
student=60
while true
do
    echo "1. Display sem and yr"
    echo "2. display course"
    echo "3. number of student in sem"
    echo "4. Exit"
    echo "Enter you choice"
    read choice
    case $choice in
        1)
            echo "Semister : $sem:"
            echo "year : $year"
            ;;
        2)
            echo "Course"
            echo "1. Operation sysytem"
            echo "3. Programing with python"
            echo "3. Business Enthis and corporate governance"
            ;;
        3)
            echo "Number of student in semister $sem: $student"
            ;;
        4)
            echo "Close"
            break
            ;;
        *)
            echo "Invalid choice"
            ;;
    esac
done
