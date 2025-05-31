#!/bin/bash
# Update and install dependencies
sudo yum install epel-release -y
sudo yum update -y
sudo yum install wget -y

# Install Erlang (required by RabbitMQ)
cd /tmp/
wget http://packages.erlang-solutions.com/erlang-solutions-2.0-1.noarch.rpm
sudo rpm -Uvh erlang-solutions-2.0-1.noarch.rpm
sudo yum -y install erlang socat

# Add RabbitMQ repository and install
curl -s https://packagecloud.io/install/repositories/rabbitmq/rabbitmq-server/script.rpm.sh | sudo bash
sudo yum install rabbitmq-server -y

# Start and enable the RabbitMQ service
sudo systemctl start rabbitmq-server
sudo systemctl enable rabbitmq-server
sudo systemctl status rabbitmq-server

# Allow external access to RabbitMQ web console
sudo sh -c 'echo "[{rabbit, [{loopback_users, []}]}]." > /etc/rabbitmq/rabbitmq.config'

# Create test admin user
sudo rabbitmqctl add_user test test
sudo rabbitmqctl set_user_tags test administrator

# Restart RabbitMQ to apply changes
sudo systemctl restart rabbitmq-server
