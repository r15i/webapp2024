#!/bin/bash
echo need to add a variable for the position we want 
echo starting the tomcat service 
sudo ./utilities_linux/start_services.sh 
echo starting browser
google-chrome-stable http://localhost:8080/x/ > /dev/null &
echo setting the aliases
alias deploy='/home/r15i/Scrivania/webapp2024/utilities_linux/autocopy.sh'
alias compile='javac -cp /usr/share/tomcat10/lib/servlet-api.jar'




