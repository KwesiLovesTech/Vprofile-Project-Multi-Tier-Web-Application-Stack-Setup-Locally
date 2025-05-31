
## 🧠 Memcached Provisioning (CentOS)

This guide describes how to provision and configure **Memcached** on a CentOS-based VM (`mc01`). Memcached is a high-performance in-memory key-value store used for caching.

---

#### 🧰 Steps to Install and Configure Memcached

### 1️⃣ Access the Memcached Server

```bash
vagrant ssh mc01
sudo su -
```

---

### 2️⃣ Update the System and Install EPEL Repository

```bash
yum update -y
yum install epel-release -y
```

---

### 3️⃣ Install Memcached

```bash
yum install memcached -y
```

---

### 4️⃣ Start and Enable Memcached Service

```bash
systemctl start memcached
systemctl enable memcached
systemctl status memcached
```

---

### 5️⃣ Allow Memcached to Listen on TCP and UDP

```bash
memcached -p 11211 -U 11111 -u memcached -d
```

This command ensures Memcached listens on:
- TCP port `11211`
- UDP port `11111`

---

### 6️⃣ Verify That Memcached is Listening on Port 11211

```bash
ss -tunlp | grep 11211
```

You should see output confirming that Memcached is active on the expected port.

![Memcached Listening](images/memcached-listening-on-tcp-11211.png)

---

### ✅ Summary

- Memcached is installed and running as a daemon
- Service is enabled to auto-start on boot
- Listening on standard ports for application caching

---
