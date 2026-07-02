# 🚀 Enterprise Multi-Environment Cloud Platform (Hetzner Cloud)

An enterprise-grade, highly scalable, and modular Terraform project designed to orchestrate a multi-environment cloud infrastructure on **Hetzner Cloud (hcloud)**. This repository serves as a showcase for production-ready infrastructure-as-code (IaC) best practices, advanced dependency management, and secure state handling.

---

## 🗺️ Project Architecture & Layout

The project enforces strict separation of concerns using a **Directory-based Multi-Environment** approach rather than standard Terraform Workspaces. This isolates state configurations and access controls between Development and Production tiers.

```text
.
├── environments
│   ├── dev                  # Development Environment (Fast iteration, low cost)
│   │   ├── backend.tf       # Isolated state backend
│   │   ├── main.tf          # Core wiring of dev modules
│   │   ├── outputs.tf       # Development output metrics
│   │   ├── terraform.tfvars # Dev non-sensitive configuration values
│   │   └── variables.tf     # Dev environment scope inputs
│   └── prod                 # Production Environment (High Availability, Multi-Region)
│       ├── backend.tf
│       ├── main.tf
│       ├── outputs.tf
│       ├── terraform.tfvars
│       └── variables.tf
└── modules
    ├── compute              # Portable Compute Module (SSH Injection, Network attachment)
    │   ├── main.tf
    │   ├── outputs.tf
    │   └── variables.tf
    └── networking           # Portable Private Networking Module (Isolated Subnets)
        ├── main.tf
        ├── outputs.tf
        └── variables.tf
```

---

## ✨ Key Enterprise IaC Features Implemented

*   **DRY (Don't Repeat Yourself) Modules:** Completely decoupled, parameter-driven networking and compute building blocks.
*   **Infrastructure Isolation:** Separate CIDR blocks for Dev (`10.10.0.0/16`) and Prod (`10.20.0.0/16`) to eliminate routing overlaps during future VPC Peering or VPN tunneling.
*   **High Availability & Dynamic Loops:** Production layer automatically scales across multiple regional data centers (`nbg1` and `hel1`) leveraging Terraform `for_each` loops on dynamic maps instead of rigid `count` index arrays.
*   **Secure Remote Backend Schema:** Configured for remote S3-compatible object storages utilizing zero-plaintext token exposure principles via runtime environment mapping.
*   **Safe Dependency Trees:** Relies exclusively on implicit resource graph tracking for sequencing (`module.dev_networking.network_id`), completely removing risky explicit module `depends_on` hooks.
*   **Data-Driven Subsystems:** Uses `Data Sources` rather than resources for pre-existing cloud assets (e.g., enterprise SSH keys) to enforce proper resource lifecycle control and prevent destructive `terraform destroy` cascading.

---

## 🛠️ Requirements & Deployment Guide

### Prerequisites
*   Terraform `CLI >= 1.5.0`
*   WSL2 (Ubuntu / Debian environment)
*   Hetzner Cloud API Access Token

### Secure Initialization (Dev Target)

1. **Avoid Secret Hardcoding:** Export your Hetzner Token directly to your shell environment using the dynamic prefix:
   ```bash
   export TF_VAR_hcloud_token="your_64_character_hetzner_api_token"
   ```

2. **Navigate & Bootstrap:**
   ```bash
   cd environments/dev
   terraform init
   ```

3. **Dry-Run Analysis:**
   ```bash
   terraform plan
   ```

4. **Orchestrate Real Infrastructure:**
   ```bash
   terraform apply
   ```

---
