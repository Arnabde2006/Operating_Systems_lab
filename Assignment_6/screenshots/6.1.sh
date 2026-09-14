#!/bin/sh
# Assignment 6.1 - Sum of digits of a number
echo "Enter a number:"
read n
sum=0
while [ $n -gt 0 ]
do
    digit=`expr $n % 10`
    sum=`expr $sum + $digit`
    n=`expr $n / 10`
done
echo "Sum of digits: $sum"
