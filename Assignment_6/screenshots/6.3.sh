#!/bin/sh
# Assignment 6.3 - Check whether a number is prime
echo "Enter a number:"
read n
flag=1
i=2
while [ $i -le `expr $n / 2` ] && [ $flag -eq 1 ]
do
    if [ `expr $n % $i` -eq 0 ]
    then
        flag=0
    fi
    i=`expr $i + 1`
done
if [ $n -gt 1 ] && [ $flag -eq 1 ]
then
    echo "$n is a prime number"
else
    echo "$n is not a prime number"
fi
