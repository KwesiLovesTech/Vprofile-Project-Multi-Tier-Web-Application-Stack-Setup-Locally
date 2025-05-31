
# 🛠️ MySQL (MariaDB) Provisioning with Vagrant

This project demonstrates how to provision a **MySQL-compatible** database using **MariaDB** inside a Vagrant-managed CentOS VM. It includes secure installation, database setup, and schema import for integration with application services.

---

## 🧰 Step-by-Step Setup

### 1️⃣ SSH into the Database VM

```bash
vagrant ssh db01
```
---

### 2️⃣ Switch to Root and Update Packages

```bash
sudo su -
yum update -y
```

---

### 3️⃣ Set and Persist Database Password

```bash
DATABASE_PASS='admin123'
```

To make the password persistent across sessions:

```bash
echo "export DATABASE_PASS='admin123'" >> /etc/profile
source /etc/profile
```

---

### 4️⃣ Install EPEL and MariaDB

```bash
yum install epel-release -y
yum install git mariadb-server -y
```

---

### 5️⃣ Enable and Start MariaDB

```bash
systemctl start mariadb
systemctl enable mariadb
systemctl status mariadb
```

Ensure the status shows `active (running)`.

---

### 6️⃣ Secure the MariaDB Installation

Run the secure installation script:

```bash
mysql_secure_installation
```

#### Recommended inputs:
- Set root password: `admin123`
- Remove anonymous users: `Y`
- Disallow root login remotely: `N`
- Remove test database: `Y`
- Reload privilege tables: `Y`

---

### 7️⃣ Verify Database Login

```bash
mysql -u root -p
# Enter password: admin123
exit
```

> You should be able to log in successfully to MariaDB.

![Connected to MariaDB](images/connected-to-mariadb.png)

---

### 8️⃣ Clone the Application Repository

```bash
git clone https://github.com/KwesiLovesTech/Vprofile-Project-Multi-Tier-Web-Application-Stack-Setup-Locally.git

cd vprofile-project/src/main/resources/
```

---

### 9️⃣ Create and Configure the Database

Run the following commands to create the `accounts` database, configure access, and import data:

```bash
mysql -u root -p"$DATABASE_PASS" -e "create database accounts"
mysql -u root -p"$DATABASE_PASS" -e "grant all privileges on accounts.* TO 'admin'@'app01' identified by 'admin123'"
cd ../../..
mysql -u root -p"$DATABASE_PASS" accounts < src/main/resources/db_backup.sql
mysql -u root -p"$DATABASE_PASS" -e "FLUSH PRIVILEGES"
```

---

### 🔎 10️⃣ Verify the Schema

```bash
mysql -u root -p"$DATABASE_PASS"
MariaDB [(none)]> show databases;
MariaDB [(none)]> use accounts;
MariaDB [accounts]> show tables;
exit
```

You should see tables such as `role`, `user`, and `user_role`.

---

### 🔄 11️⃣ Restart MariaDB and Logout

```bash
systemctl restart mariadb
logout
```

---

## ✅ What This Setup Delivers

- A secured and up-to-date MariaDB server
- `accounts` database initialized with sample schema
- Database user `admin` with access from `app01` application server
- Ready-to-integrate backend for your full-stack deployment

---

## 🧩 Next Steps

Now that your database is ready, you can proceed to configure the application tier (`app01`) and front-end (`web01`) to complete the stack setup.

---
