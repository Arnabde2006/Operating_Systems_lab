#!/bin/sh
# Assignment 7.2 - Print pattern: 1, 12, 123, 1234, 12345
n=5
for (( i=1; i<=n; i++ ))
do
    for (( j=1; j<=i; j++ ))
    do
        echo -n "$j"
    done
    echo
done
