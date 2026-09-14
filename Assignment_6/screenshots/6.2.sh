#!/bin/sh
# Assignment 6.2 - Fibonacci series up to n terms
echo "Enter number of terms:"
read n
a=0
b=1
i=0
echo "Fibonacci Series:"
while [ $i -lt $n ]
do
    echo -n "$a "
    fn=`expr $a + $b`
    a=$b
    b=$fn
    i=`expr $i + 1`
done
echo
