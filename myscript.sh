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

first=29
second=20

expr $first + $second
expr $first \* $second #not without the escape char, reserved special char

#if statement, !-negates, -eq equal, -ne not equal, -gt greater than, -f file, -d folder 
if [ ! $first -eq 30 ]
then
	echo "first equals to 30"
else
	echo "it is not equal to 30"
fi

if [ -f ~/berserker ]
then
	echo "file berserker exists"
else
	echo "file does not exist"
fi

htop=/usr/bin/htop
command=htop

if [ -f $htop ] #or use if command -v $command - it checks if a command exists, note that it's without brackets, brackets are used if there's a test
then
	echo "$htop is available, launching..."
else
	echo "$htop is NOT avaialble, installing..."
	sudo apt update && sudo apt install -y htop
fi

#$htop #it would normally would run htop

#exit codes

# exit codes

echo $? # $? checks for the exit code of last action, 0 means successful

date=$(date +%Y-%m-%d_%H-%M-%S)

if [ $? -eq 0 ]
then
	echo "Last command was successful at $date" >> script_results_$date.log
else
	echo "Last command was not successful at $date"  >> script_results_$date.log
fi
