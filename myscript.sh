#!/bin/bash

echo "Hello world!"

echo "My current working directory is: "
pwd

mynick="Rapnyt"
myage="40"

echo "Hello, my name is $mynick."
echo "I'm $myage years old."

#single quotes vs double, need to add escape char in order to continue with the quote if single

echo "I'm a test."

files=$(ls ~)

now=$(date)

echo "The system time and date is: " $now

expr 30 + 10

first=30
second=20

expr $first + $second
expr $first \* $second #not without the escape char, reserved special char
