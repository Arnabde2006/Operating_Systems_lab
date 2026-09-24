#!/bin/sh
# Assignment 7.4 - Calculator with simple arithmetic operations
echo "Enter first number"
read n1
echo "Enter second number"
read n2

echo "Press 1 to add:"
echo "Press 2 subtract"
echo "Press 3 for multiply "
echo "Press 4 for divide"
echo "Enter your choice"
read a

case $a in
 1)
    echo "Addition = `expr $n1 + $n2`"
 ;;
 2)
    echo "Subtraction = `expr $n1 - $n2`"
 ;;
 3)
    echo "Multiply = `expr $n1 \* $n2`"
 ;;
 4)
    if [ $n2 -eq 0 ]
    then
        echo "Division by zero is not possible"
    else
        echo "Division= `expr $n1 / $n2`"
    fi
 ;;
 *)
    echo "Invalid choice"
 ;;
esac
