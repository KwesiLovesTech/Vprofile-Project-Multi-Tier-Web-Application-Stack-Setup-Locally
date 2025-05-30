#!/bin/bash

# Update system and install nginx
apt update
apt install nginx -y

# Create Nginx upstream configuration for reverse proxy
cat <<EOT > vproapp
upstream vproapp {
    server app01:8080;
}

server {
    listen 80;

    location / {
        proxy_pass http://vproapp;
    }
}
EOT

# Apply the custom configuration
mv vproapp /etc/nginx/sites-available/vproapp
rm -rf /etc/nginx/sites-enabled/default
ln -s /etc/nginx/sites-available/vproapp /etc/nginx/sites-enabled/vproapp

# Start and enable Nginx service
systemctl start nginx
systemctl enable nginx
systemctl restart nginx
