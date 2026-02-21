# NetEASE Infrastructure

## Overview
NetEASE (Network Enterprise Authentication & Security Engine) is a centralized AAA solution designed for university lab environments. This repository contains the Infrastructure-as-Code (IaC) components.

## Tech Stack
* **Containerization:** Docker & Docker Compose
* **AAA Engine:** FreeRADIUS 3.0
* **Database:** MariaDB 10.6 (SQL-based authentication)
* **VPN:** StrongSwan (IPsec IKEv2 Site-to-Site)

## Key Features
* **Role-Based Access Control (RBAC):** Dynamic VLAN assignment (Staff vs. Student).
* **Cloud-Managed:** Deployed on DigitalOcean for 99.9% uptime.
* **Secure Tunneling:** Encrypted traffic from Lab Firewall to Cloud.
