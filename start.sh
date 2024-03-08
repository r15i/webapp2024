#!/bin/bash
echo need to add a variable for the position we want 
echo starting hot server 
browser-sync start  --server --files x/**/* --startPath x/ --no-notify> /dev/null &
echo setting the aliases
alias deploy='/home/r15i/Scrivania/webapp2024/utilities_linux/deploy.sh'
alias compile='javac -cp /usr/share/tomcat10/lib/servlet-api.jar'




