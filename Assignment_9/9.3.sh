#!/bin/sh
# Assignment 9.3 - Menu-driven script to find area of circle, square, rectangle
while true
do
    echo "1. Area of Circle"
    echo "2. Area of Square"
    echo "3. Area of Rectangle"
    echo "4. Exit"
    echo "Enter you choice"
    read choice
    case $choice in
        1)
            echo "Enter radius:"
            read r
            area=`expr 22 \* $r \* $r / 7`
            echo "Area of circle : $area"
            ;;
        2)
            echo "Enter side"
            read s
            area=`expr $s \* $s`
            echo "Area of squar : $area"
            ;;
        3)
            echo "length of rectangle"
            read l
            echo "Enter breadth"
            read b
            area=`expr $l \* $b`
            echo "Area of rec : $area"
            ;;
        4)
            echo "Close"
            break
            ;;
        *)
            echo "invalid choice"
            ;;
    esac
done
