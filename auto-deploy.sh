#!/bin/bash

echo "script init"

# Set the jre home
export JAVA_HOME=/home/dickson/.asdf/installs/java/openjdk-20.0.1

# Create maven app
mvn clean package

# Delete previous build from tomcat
rm /home/dickson/.asdf/installs/tomcat/10.1.20/webapps/todo-app.war
rm -r /home/dickson/.asdf/installs/tomcat/10.1.20/webapps/todo-app

# copy deploy rar to tomcat
cp ./target/todo-app.war /home/dickson/.asdf/installs/tomcat/10.1.20/webapps/

# Re run tomcat server
/home/dickson/.asdf/installs/tomcat/10.1.20/bin/shutdown.sh
/home/dickson/.asdf/installs/tomcat/10.1.20/bin/startup.sh
