#!/bin/bash

#This will move all of the tar.gz files to a seperate folder
n=0
for file in ~/Scripts/Bash-Scripts/*.tar.gz
do 
	if [ -f "$file" ]
	then
		mv -f "$file" "$HOME/Scripts/Bash-Scripts/tar.gz/"
		n=$(( $n +1 ))
	fi
done

if [ $n -eq 0 ]
then
	echo "No files to be moved"
else    
	echo "Moved $n files to tar.gz folder"
fi
