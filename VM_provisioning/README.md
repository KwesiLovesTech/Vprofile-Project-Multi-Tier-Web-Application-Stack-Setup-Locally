# 🖥️ Local Three-Tier Architecture with Vagrant

This repository contains a `Vagrantfile` to spin up a multi-VM environment simulating a basic three-tier architecture on your local machine.

---

## 📦 Provisioned VMs

| VM Name   | Purpose                  | IP Address        | OS           |
|-----------|--------------------------|-------------------|--------------|
| `web01`   | Nginx Web Server         | 192.168.56.11    | Ubuntu 18.04 |
| `app01`   | Tomcat App Server        | 192.168.56.12    | CentOS 7     |
| `rmq01`   | RabbitMQ Broker          | 192.168.56.13    | CentOS 7     |
| `mc01`    | Memcache Caching Layer   | 192.168.56.14    | CentOS 7     |
| `db01`    | MySQL Database           | 192.168.56.15    | CentOS 7     |

Each VM is provisioned with **1024 MB of memory** and configured on a **private network**.

---

## 🚀 Getting Started

1. **Install prerequisites**:
   - [VirtualBox](https://www.virtualbox.org/)
   - [Vagrant](https://www.vagrantup.com/)

2. **Clone this repo**:
   ```bash
   git clone https://github.com/KwesiLovesTech/Vprofile-Project-Multi-Tier-Web-Application-Stack-Setup-Locally

   cd VM_provisioning

3. **Start the environment**:
    ```bash
    vagrant up

