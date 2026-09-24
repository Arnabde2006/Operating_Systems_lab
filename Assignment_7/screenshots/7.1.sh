#!/bin/sh
# Assignment 7.1 - GCD of two numbers
echo "Enter first number"
read a
echo "Enter second number"
read b
while [ $b -ne 0 ]
do
    r=`expr $a % $b`
    a=$b
    b=$r
done
echo "GCD: $a"
