echo need to add a variable 
sudo rm -rf /var/lib/tomcat10/webapps/x
sudo cp -r /home/r15i/Scrivania/webapp2024/x /var/lib/tomcat10/webapps/x
sudo systemctl restart tomcat10
xdotool search --onlyvisible --class Chrome windowfocus key ctrl+r

