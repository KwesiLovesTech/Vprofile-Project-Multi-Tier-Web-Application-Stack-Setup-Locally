#!/bin/bash

# Update and install EPEL repository
sudo yum update -y
sudo yum install epel-release -y

# Install Memcached
sudo yum install memcached -y

# Start and enable Memcached service
sudo systemctl start memcached
sudo systemctl enable memcached
sudo systemctl status memcached

# Allow Memcached to listen on TCP and UDP ports
memcached -p 11211 -U 11111 -u memcached -d

# Validate the service is listening on the correct port
ss -tunlp | grep 11211
