#!/bin/sh
# Assignment 7.6 - ATM system (check balance, deposit, withdrawal)
balance=5000

while true
do
    echo "-------- ATM MENU --------"
    echo "Press 1 to check balance"
    echo "Press 2 to deposit"
    echo "Press 3 to withdraw"
    echo "Press 4 to exit"
    echo "Enter your choice"
    read choice

    case $choice in
     1)
        echo "Your balance is: $balance"
     ;;
     2)
        echo "Enter amount to deposit"
        read amt
        balance=`expr $balance + $amt`
        echo "Deposit successful. New balance: $balance"
     ;;
     3)
        echo "Enter amount to withdraw"
        read amt
        if [ $amt -gt $balance ]
        then
            echo "Insufficient balance"
        else
            balance=`expr $balance - $amt`
            echo "Withdrawal successful. New balance: $balance"
        fi
     ;;
     4)
        echo "Thank you for using the ATM"
        break
     ;;
     *)
        echo "Invalid choice"
     ;;
    esac
    echo ""
done
