#!/bin/sh
# Assignment 7.5 - Generate a mark sheet for five subjects
echo "enter marks of five sub:"
read a
read b
read c
read d
read e

total=`expr $a + $b + $c + $d + $e`
per=`expr $total / 5`

echo "Total = $total"
echo "Percentage = $per%"

if test $per -ge 60
then
    echo "passed with Distinction"
elif test $per -ge 50
then
    echo "passed with second class"
elif test $per -ge 40
then
    echo "passed with third class"
else
    echo "failed"
fi
