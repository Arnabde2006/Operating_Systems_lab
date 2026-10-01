#!/bin/sh
# Assignment 9.2 - Menu-driven ATM operations
balance=1000
while true
do
    echo "1. Check current balance"
    echo "2. Deposit ammount"
    echo "3. Withdraw"
    echo "4. Exit"
    echo "Enter you choice"
    read choice
    case $choice in
        1)
            echo "Current balance: $balance"
            ;;
        2)
            echo "Enter amount to deposit"
            read amt
            if [ amt -gt 0 ]
            then
                balance=`expr $balance + $amt`
                echo "Deposited $amt"
                echo "current balance : $balance"
            else
                echo "invalid ammount"
            fi
            ;;
        3)
            echo "Enter amount to withdraw"
            read amt
            if [ $amt -le 0 ]
            then
                echo "invalid"
            elif [ $amt -gt $balance ]
            then
                echo "insff"
            else
                balance=`expr $balance - $amt`
                echo "withdraw :$amt"
                echo "current balance :$balance"
            fi
            ;;
        4)
            echo "Yo ATM"
            break ;;
        *)
            echo "invalid choice"
            ;;
    esac
done
