
## 🐇 RabbitMQ Provisioning (CentOS)

This guide walks through provisioning and configuring **RabbitMQ** on a CentOS-based VM (`rmq01`). It includes installation of required dependencies, configuration of user access, and service management.

---

### 🧰 Step-by-Step Setup

### 1️⃣ Log in to the `rmq01` Server

```bash
vagrant ssh rmq01
sudo su -
```

---

### 2️⃣ Update the System and Add EPEL Repository

```bash
yum update -y
yum install epel-release -y
```

---

### 3️⃣ Install Dependencies for RabbitMQ

```bash
yum install wget -y
cd /tmp/
wget http://packages.erlang-solutions.com/erlang-solutions-2.0-1.noarch.rpm
sudo rpm -Uvh erlang-solutions-2.0-1.noarch.rpm
```

---

### 4️⃣ Install RabbitMQ Server

```bash
curl -s https://packagecloud.io/install/repositories/rabbitmq/rabbitmq-server/script.rpm.sh | sudo bash
sudo yum install rabbitmq-server -y
```

---

### 5️⃣ Start and Enable RabbitMQ Service

```bash
systemctl start rabbitmq-server
systemctl enable rabbitmq-server
systemctl status rabbitmq-server
```

---

### 6️⃣ Configure RabbitMQ and Create Admin User

```bash
cd ~
echo "[{rabbit, [{loopback_users, []}]}]." > /etc/rabbitmq/rabbitmq.config
rabbitmqctl add_user test test
rabbitmqctl set_user_tags test administrator
systemctl restart rabbitmq-server
```

---

### ✅ Verify Service Status

```bash
systemctl status rabbitmq-server
exit
```

---

### 📝 Summary

- RabbitMQ installed and running on `rmq01`
- Test user `test` with password `test` and administrator rights created
- Configuration set to allow external access to the RabbitMQ Web UI

RabbitMQ is now ready to be integrated with your backend application.

