echo need to add a variable 
echo stopping service 
sudo systemctl stop tomcat10
echo deleting old version
sudo rm -rf /var/lib/tomcat10/webapps/x
echo copy the new version 
sudo cp -r /home/r15i/Scrivania/webapp2024/x /var/lib/tomcat10/webapps/x
echo chainging the ownership to make it executable by the service
sudo chown -R tomcat10 /var/lib/tomcat10/webapps/x/ 
echo restarting the service 
sudo systemctl restart tomcat10
sleep 3 
echo updating the screen
xdotool search --onlyvisible --class Chrome windowfocus key ctrl+r

