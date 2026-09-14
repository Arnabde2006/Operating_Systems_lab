#!/bin/sh
# Assignment 6.5 - Reverse the digits of a number
echo "Enter a number:"
read n
rev=0
while [ $n -gt 0 ]
do
    digit=`expr $n % 10`
    rev=`expr $rev \* 10 + $digit`
    n=`expr $n / 10`
done
echo "Reversed number: $rev"
