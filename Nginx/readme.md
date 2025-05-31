
## 🌐 Nginx Provisioning (Ubuntu)

This guide details the steps to install and configure **Nginx** as a reverse proxy on an Ubuntu-based VM (`web01`). It forwards traffic to the backend application running on `app01:8080`.

---

### 🧰 Step-by-Step Setup

### 1️⃣ Update the System

```bash
sudo apt update && sudo apt upgrade -y
```

---

### 2️⃣ Install Nginx

```bash
sudo su -
apt install nginx -y
```

---

### 3️⃣ Create Custom Nginx Configuration

Create a new configuration file:

```bash
vi /etc/nginx/sites-available/vproapp
```

Add the following content:

```
upstream vproapp {
    server app01:8080;
}

server {
    listen 80;

    location / {
        proxy_pass http://vproapp;
    }
}
```

---

### 4️⃣ Enable Custom Configuration

Remove the default site:

```bash
rm -rf /etc/nginx/sites-enabled/default
```

Create a symbolic link to enable the new site:

```bash
ln -s /etc/nginx/sites-available/vproapp /etc/nginx/sites-enabled/vproapp
```

Restart the Nginx service:

```bash
systemctl restart nginx
```

---

### ✅ Validate Application in Browser

Check the IP address of `web01`:

```bash
ifconfig
```

Sample output:

```
enp0s8: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 192.168.56.11
```

Open your browser and navigate to:

```
http://192.168.56.11
```

You should see the frontend being served and proxied to the backend.

---

### 📝 Summary

- Nginx installed and configured as a reverse proxy
- Requests to `web01` on port `80` are forwarded to `app01:8080`
- Application is accessible via browser at the server's IP
