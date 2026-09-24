#!/bin/sh
# Assignment 7.3 - Print pattern: 1, 22, 333, 4444, 55555
i=1
while [ $i -le 5 ]
do
    j=1
    while [ $j -le $i ]
    do
        echo -n "$i"
        j=`expr $j + 1`
    done
    echo
    i=`expr $i + 1`
done
