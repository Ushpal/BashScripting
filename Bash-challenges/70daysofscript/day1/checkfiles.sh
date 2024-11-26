#!/bin/bash

echo "Today is" `date`
echo -e "\nenter the path to directory"
read the_path  #path to see/check, this is used for checking backups manually.

echo -e "\n your path has the following files and folder:"
ls $the_path







#to run the above code promyt in terminal: chmod u+x checkfiles.sh -> sh checkfiles.sh or bash checkfiles.sh 