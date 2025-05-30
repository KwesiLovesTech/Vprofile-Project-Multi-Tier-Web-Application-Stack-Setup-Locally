#!/bin/bash

TOMURL="https://archive.apache.org/dist/tomcat/tomcat-8/v8.5.37/bin/apache-tomcat-8.5.37.tar.gz"

# Install Java and other dependencies
yum install java-1.8.0-openjdk -y
yum install git maven wget -y

# Download and extract Tomcat
cd /tmp/
wget $TOMURL -O tomcatbin.tar.gz
EXTOUT=$(tar xzvf tomcatbin.tar.gz)
TOMDIR=$(echo $EXTOUT | cut -d '/' -f1)

# Create tomcat user and copy files
useradd --shell /sbin/nologin tomcat
rsync -avzh /tmp/$TOMDIR/ /usr/local/tomcat8/
chown -R tomcat.tomcat /usr/local/tomcat8

# Remove existing systemd service file if it exists
rm -rf /etc/systemd/system/tomcat.service

# Create tomcat systemd service
cat <<EOT >> /etc/systemd/system/tomcat.service
[Unit]
Description=Tomcat
After=network.target

[Service]
User=tomcat
Group=tomcat
WorkingDirectory=/usr/local/tomcat8
Environment=JAVA_HOME=/usr/lib/jvm/jre
Environment=CATALINA_PID=/var/tomcat/%i/run/tomcat.pid
Environment=CATALINA_HOME=/usr/local/tomcat8
Environment=CATALINE_BASE=/usr/local/tomcat8
ExecStart=/usr/local/tomcat8/bin/catalina.sh run
ExecStop=/usr/local/tomcat8/bin/shutdown.sh
RestartSec=10
Restart=always

[Install]
WantedBy=multi-user.target
EOT

# Enable and start tomcat service
systemctl daemon-reload
systemctl start tomcat
systemctl enable tomcat

# Build and deploy the application
git clone -b local-setup https://github.com/devopshydclub/vprofile-project.git
cd vprofile-project
mvn install

# Deploy WAR file
systemctl stop tomcat
sleep 60
rm -rf /usr/local/tomcat8/webapps/ROOT*
cp target/vprofile-v2.war /usr/local/tomcat8/webapps/ROOT.war

# Final restart and property file copy
systemctl start tomcat
sleep 120
cp /vagrant/application.properties /usr/local/tomcat8/webapps/ROOT/WEB-INF/classes/application.properties
systemctl restart tomcat
