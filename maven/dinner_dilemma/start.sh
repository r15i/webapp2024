#!/bin/bash 
sudo systemctl restart tomcat10
sudo systemctl restart postgresql


sleep 5
alias updt='mvn cargo:undeploy; mvn clean package cargo:deploy'
alias hrs='browser-sync start  --server --files  src/main/webapp/**/* --startPath src/main/webapp/html/'
#relative hooks 
#/home/r15i/Scrivania/webapp2024/maven/test_deploy
hp=$PWD
sweb="$PWD/src/main/webapp/"
j="$PWD/src/main/java/"
jweb="$PWD/src/main/java/it/unipd/dei/webapp/"
db="$PWD/src/main/database/"
google-chrome-stable http://localhost:8080/manager/html> /dev/null 

