
## ☕ Tomcat Provisioning (CentOS)

This guide outlines the steps required to provision **Apache Tomcat 8** on a CentOS-based VM (`app01`). It includes the full configuration of the service, application build using Maven, and deployment of a WAR file.

---

### 🧰 Step-by-Step Setup

### 1️⃣ Log in to the `app01` Server

```bash
vagrant ssh app01
sudo su -
```

---

### 2️⃣ Update System and Install Dependencies

```bash
yum update -y
yum install epel-release -y
yum install java-1.8.0-openjdk -y
yum install git maven wget -y
```

---

### 3️⃣ Download and Extract Tomcat

```bash
cd /tmp
wget https://archive.apache.org/dist/tomcat/tomcat-8/v8.5.37/bin/apache-tomcat-8.5.37.tar.gz
tar xzvf apache-tomcat-8.5.37.tar.gz
```

---

### 4️⃣ Create Tomcat User and Set Directory Permissions

```bash
useradd --home-dir /usr/local/tomcat8 --shell /sbin/nologin tomcat
cp -r /tmp/apache-tomcat-8.5.37/* /usr/local/tomcat8/
chown -R tomcat.tomcat /usr/local/tomcat8
```

---

### 5️⃣ Create Tomcat Systemd Service File

```bash
vi /etc/systemd/system/tomcat.service
```

Add the following content:

```
[Unit]
Description=Tomcat
After=network.target

[Service]
User=tomcat
WorkingDirectory=/usr/local/tomcat8
Environment=JRE_HOME=/usr/lib/jvm/jre
Environment=JAVA_HOME=/usr/lib/jvm/jre
Environment=CATALINA_HOME=/usr/local/tomcat8
Environment=CATALINE_BASE=/usr/local/tomcat8
ExecStart=/usr/local/tomcat8/bin/catalina.sh run
ExecStop=/usr/local/tomcat8/bin/shutdown.sh
SyslogIdentifier=tomcat-%i

[Install]
WantedBy=multi-user.target
```

---

### 6️⃣ Reload Daemon and Start Tomcat

```bash
systemctl daemon-reload
systemctl enable tomcat
systemctl start tomcat
systemctl status tomcat
```

---

## 🧪 Code Build & Deployment

### 7️⃣ Clone and Build the Application

```bash
cd /tmp

git clone https://github.com/KwesiLovesTech/Vprofile-Project-Multi-Tier-Web-Application-Stack-Setup-Locally.git

cd vprofile-project/
```

Edit the configuration file:

```bash
vi src/main/resources/application.properties
```

Update with:

```
# Database
jdbc.url=jdbc:mysql://db01:3306/accounts?useUnicode=true&characterEncoding=UTF-8&zeroDateTimeBehavior=convertToNull
jdbc.username=admin
jdbc.password=admin123

# Memcached
memcached.active.host=mc01
memcached.active.port=11211

# RabbitMQ
rabbitmq.address=rmq01
rabbitmq.port=5672
rabbitmq.username=test
rabbitmq.password=test
```

Build the project:

```bash
mvn install
cd target/
ls
```

---

### 8️⃣ Deploy to Tomcat

```bash
systemctl stop tomcat
rm -rf /usr/local/tomcat8/webapps/ROOT
cp vprofile-v2.war /usr/local/tomcat8/webapps/ROOT.war
systemctl start tomcat
```

Tomcat will extract the `ROOT.war` file and deploy your application.

---

### ✅ Final Result

Your Java-based web application is now deployed and running on Tomcat inside the `app01` server. You can test this by navigating to your VM’s IP address in a browser.

---

### 📝 Notes

- Java 8 is required for Tomcat 8 compatibility.
- Ensure backend services (`db01`, `mc01`, `rmq01`) are up and reachable from `app01`.
