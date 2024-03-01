sudo ./utilities_linux/start_services.sh 
google-chrome-stable http://localhost:8080/ > /dev/null &
bash --init-file <(echo "cd /var/lib/tomcat10/webapps/ROOT/")

