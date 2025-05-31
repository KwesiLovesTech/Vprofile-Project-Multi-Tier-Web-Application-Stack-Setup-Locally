# 🏗️ Three-Tier Architecture Lab Setup (Local VM Deployment)

This repository contains a complete guide to building a **Three-Tier Architecture** on your **local machine** using Virtual Machines. I plan to simulate production-like infrastructure locally and migrate to an  AWS Cloud environment.

---

## 📚 Overview

A traditional three-tier architecture separates applications into three logical layers:

- **Web Tier** – Handles incoming user requests via a web interface.
- **Application Tier** – Processes business logic using a Java-based application server.
- **Database Tier** – Manages and stores persistent data.

This setup enhances scalability, manageability, and security by decoupling responsibilities across services.

---

## 🧱 Architecture Diagram

Below is a simplified representation of the architecture I'm  going to build:

![diagram](/Images/Vprofile.jpg)

[*project source*](https://www.udemy.com/course/devopsprojects/?src=sac&kw=devops+projects&couponCode=24T7MT260525G3)

---

## 🖥️ VM Provisioning Plan

To simulate the full stack, you will provision the following six virtual machines:

| VM Name            | Role                              | Operating System |
|--------------------|-----------------------------------|------------------|
| `nginx-vm`         | Web Service (Nginx)               | Ubuntu           |
| `tomcat-vm`        | Application Server (Tomcat)       | Ubuntu           |
| `rabbitmq-vm`      | Message Broker (RabbitMQ)         | Ubuntu           |
| `memcache-vm`      | Caching Layer (Memcached)         | Ubuntu           |
| `elasticsearch-vm` | Search Engine (ElasticSearch)     | CentOS           |
| `mysql-vm`         | Database (MySQL)                  | CentOS           |


use this [link](https://github.com/KwesiLovesTech/Create-VM-manually-or-automatically-using-Vagrant-by-HashiCorp) to setup vms manually.

---

## 🔧 Components Breakdown

- **Nginx**: Serves as the entry point and reverse proxy.
- **Tomcat**: Hosts Java-based applications.
- **RabbitMQ**: Facilitates message-based communication between components.
- **Memcache**: Provides fast in-memory caching.
- **ElasticSearch**: Enables search, analytics, and indexing.
- **MySQL**: Relational database to store structured application data.

---

## 🚀 Use Cases

- Test service-to-service communication in isolated environments.
- Experiment with app deployments, queuing systems, caching, and indexing.
- Build familiarity with multi-tier architecture and DevOps practices.

---
## 🪜 Step-by-Step Setup Instructions

| Step | Action                  | Details                                                                                             | Link / Command                                                                 |
|------|-------------------------|-----------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------|
| 1️⃣   | Create Infrastructure   | Automatically provision the architecture on your local machine using Vagrant                       |  [ Instructions here](https://github.com/KwesiLovesTech/Vprofile-Project-Multi-Tier-Web-Application-Stack-Setup-Locally/tree/main/VM_provisioning) |
| 2️⃣   | Start Project           | Launch all 6 VMs with one command                                                                   | `vagrant up`                                                                   |
| 3️⃣   | Open VirtualBox         | Confirm all VMs are running:<br>- `web01` (Nginx)<br>- `app01` (Tomcat)<br>- `rmq01` (RabbitMQ)<br>- `mc01` (Memcache)<br>- `db01` (MySQL) | [📷 Sample Screenshot](/Images/VMs-are-running-in-VirtualBox.png)<br>[📦 VirtualBox Download](https://www.virtualbox.org/wiki/Downloads) |
| 4️⃣   | SSH into VMs            | Access individual VMs via SSH for configuration, setup and  testing in the following recommended order   <br> i - `db01` [MySQL](https://github.com/KwesiLovesTech/Vprofile-Project-Multi-Tier-Web-Application-Stack-Setup-Locally/tree/main/MySQL)<br> ii - `mc01` [Memcache](https://github.com/KwesiLovesTech/Vprofile-Project-Multi-Tier-Web-Application-Stack-Setup-Locally/tree/main/Memcached)<br> iii - `rmq01` [RabbitMQ](https://github.com/KwesiLovesTech/Vprofile-Project-Multi-Tier-Web-Application-Stack-Setup-Locally/tree/main/RabbitMq)<br> iv - `app01` [Tomcat](https://github.com/KwesiLovesTech/Vprofile-Project-Multi-Tier-Web-Application-Stack-Setup-Locally/tree/main/Tomcat)<br> v - `web01` [Nginx](https://github.com/KwesiLovesTech/Vprofile-Project-Multi-Tier-Web-Application-Stack-Setup-Locally/tree/main/Nginx)                               | `vagrant ssh <vm_name>`<br>Example: `vagrant ssh web01`                        |
| 5️⃣   | Halt or Destroy VMs     | Stop or delete all VMs to free up local system resources                                            | `vagrant halt` or `vagrant destroy`                                            |
