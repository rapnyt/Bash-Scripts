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

#exit 199
echo $? #normally it would exit with previous command with exit code of 199, but the echoe $? will not be executed within the script, because the excript has ended. Still if we manually do the echo $? it will give out exit code of 199

sudo apt-get install dsjkfhdskfsdh >> logs_$date.log #it will create the log, but if the package is not present it will still print on the terminal the package does not exist message

#while loops
myvar=1

echo "this is using the while loop"

while [ $myvar -le 2 ]
do
	echo "$myvar..."
	myvar=$(( $myvar +1 )) #arithmetic operations require double (())
	sleep 0.1
done

# for loop

echo "and this is using the for loop"

for number in 1 2
do
	echo "$number..."
	sleep 0.1
done

echo "aaaaaaaaaaaand we're done."

# or in more elegant way

for number in {1..2}
do
	echo "$number..."
	sleep 0.1
done

echo -e "this way is better.\nat least at the bash level ;)"

# data stream

ls /etc 1>> standard_output_ls 2>> standard_errors_ls

echo "Please enter your name: "
read myname
echo "Your name is: $mynamei"

# functiions

check_exit_status() {
	if [ $? -ne 0 ]
	then
		echo "An error occurred"
	else
		echo "No errors"
	fi
}

check_exit_status #calling the function

# case statements

finished=0

while [ $finished -ne 1 ]
do
	echo "What is your favourite Linux distribution?'"

	echo "1 - Ubuntu"
	echo "2 - Slackware"
	echo "3 - exits the script"

	read distro;

	case $distro in
		1) echo "There are more distroes out there, you know?";;
		2) echo "The only right answer ;)";;
		3) finished=1 ;;
		*) echo "No appropiate option selected"
	esac
done

echo "Thank you for using the script."

# Arguments

if $1 
then
	echo "No argument given"
else
	echo "You have entered argument $1"
fi

if [ -d $1 ]
then
	lines=$(ls -lh $1 2>> standard_errors_ls | wc -l)
	echo "You have $(( $lines-1 )) objects in the $1 directory." 2>> standard_errors_ls
else
	echo "Directory $1 not found"
fi

