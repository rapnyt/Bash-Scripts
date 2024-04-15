#!/bin/bash

#This will move all of the log files to a seperate folder
n=0
for file in ~/Scripts/Bash-Scripts/*.log
do
	if [ -f "$file" ]
	then
		tar -czvf $file.tar.gz $file 2>/dev/null
		n=$(( $n +1 ))
	fi
done

if [ $n -eq 0 ]
then
        echo "No files to be packed"
else
        echo "Packed $n files to tar.gz folder"
fi
