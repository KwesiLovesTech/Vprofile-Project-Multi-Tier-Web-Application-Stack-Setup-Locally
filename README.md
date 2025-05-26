# 🏗️ Three-Tier Architecture Lab Setup (Local VM Deployment)

This repository contains a complete guide to building a **Three-Tier Architecture** on your **local machine** using Virtual Machines (VMs). It's ideal for anyone looking to simulate production-like infrastructure locally and migrate to a Cloud environment like AWS.

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

## 📝 License

This project is open-source and available under the [MIT License](LICENSE).

---

## 🙋‍♂️ Author

Maintained by [Kwesi Ifeogwu](https://github.com/KwesiLovesTech). Feel free to open issues or contribute!

