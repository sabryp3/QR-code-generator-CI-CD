# **📱 QR Code Generator with CI/CD Pipeline**
<p align="center"> <img src="https://img.shields.io/badge/Next.js-14-black?style=flat-square&logo=next.js" alt="Next.js"> <img src="https://img.shields.io/badge/FastAPI-0.115-009688?style=flat-square&logo=fastapi" alt="FastAPI"> <img src="https://img.shields.io/badge/AWS-EKS-FF9900?style=flat-square&logo=amazon-aws" alt="AWS EKS"> <img src="https://img.shields.io/badge/Terraform-1.0-844FBA?style=flat-square&logo=terraform" alt="Terraform"> <img src="https://img.shields.io/badge/ArgoCD-2.0-EF7B4D?style=flat-square&logo=argo" alt="ArgoCD"> <img src="https://img.shields.io/badge/Kubernetes-1.28-326CE5?style=flat-square&logo=kubernetes" alt="Kubernetes"> <img src="https://img.shields.io/badge/GitHub%20Actions-CI/CD-2088FF?style=flat-square&logo=github-actions" alt="GitHub Actions"> </p>
A complete QR code generator application featuring a Next.js frontend, FastAPI backend, and a production-grade CI/CD pipeline that provisions infrastructure on AWS EKS using Terraform, GitHub Actions, and ArgoCD for GitOps.

# 📋 Project Overview

Frontend: Next.js (Node.js 24)

Backend: Python FastAPI (3.12)

Infrastructure: AWS EKS, VPC, S3 (Terraform)

CI/CD: GitHub Actions, Docker, Helm, ArgoCD

Monitoring: Prometheus & Grafana

# 📁 Repository Layout
```
.
├── api/                       # Python FastAPI backend
├── front-end-nextjs/          # Next.js frontend
├── terraform/                 # Infrastructure as Code (AWS EKS, VPC, S3)
├── .github/workflows/         # CI/CD pipelines (GitHub Actions)
├── argocd/                    # GitOps configuration
└── qr-helm/                   # Kubernetes Helm charts
```
# ✨ Features
✅ Generate QR codes from any URL

🌐 Web-based user interface (Next.js)

☁️ AWS S3 cloud storage integration

🚀 Kubernetes-based deployment (EKS)

🔁 GitOps workflow with ArgoCD

🏗️ Infrastructure as Code with Terraform

📊 Automated monitoring (Prometheus/Grafana)

🛡️ Security scanning (SonarQube, Trivy)

# 🛠️ Tech Stack

| **Category**       | **Technologies**                                                                 |
|---------------------|----------------------------------------------------------------------------------|
| **Frontend**        | Next.js, Node.js 24                                                              |
| **Backend**         | Python 3.12, FastAPI                                                             |
| **Infrastructure**  | AWS (EKS, VPC, S3), Terraform ~1.0                                               |
| **CI/CD**           | GitHub Actions, Docker, Docker Buildx, Helm, ArgoCD                              |
| **Monitoring**      | Prometheus, Grafana                                                              |
| **Security**        | SonarCloud, Trivy (container & IaC), IAM IRSA, RBAC, Bcrypt                      |
| **Networking**      | NGINX Ingress, VPC with public/private subnets, TLS/HTTPS                        |

# ✅ Prerequisites
AWS Account with appropriate IAM permissions

Terraform >= 1.0 installed

kubectl configured

GitHub Actions enabled on your repository

Environment variables set:

S3_BUCKET_NAME, AWS_REGION, EKS_CLUSTER

GitHub Secrets configured:

SONAR_TOKEN, DOCKERHUB_TOKEN, AWS_ROLE_ARN, ARGOCD_ADMIN_PASSWORD

# 🔄 CI/CD Pipeline Workflows
**1. CI.yml – Build & Push Docker Images**

🔍 Code quality analysis with SonarQube

🧪 Python API testing with pytest

🐳 Docker image builds (API & Frontend) with Docker Buildx

🔎 Trivy vulnerability scanning (CRITICAL/HIGH severity)

📦 Push to Docker Hub tagged with git commit hash

**2. Infra-dep.yaml – Provision Infrastructure**

✅ Terraform validation and planning

🛡️ IaC security scanning with Trivy

☸️ EKS cluster provisioning

🌐 VPC and networking setup

📡 NGINX Ingress Controller installation

🔄 ArgoCD deployment via Helm

⚙️ Cluster Autoscaler setup

📊 Monitoring stack (Prometheus/Grafana)

🔗 Kubernetes connectivity verification

**3. infra-del.yaml – Destroy Infrastructure**
🧹 Clean up LoadBalancer namespaces

🗂️ Terraform state management

💥 Infrastructure destruction with cleanup

# 🔒 Security Features
SonarQube – Code quality and static analysis via SonarCloud

Trivy – Scans Docker images and Terraform IaC for vulnerabilities

GitHub Secrets – Secure storage of sensitive data

AWS IAM – Role-based access with IRSA (IAM Roles for Service Accounts)

Kubernetes RBAC – Fine-grained access control

Network Security – VPC with public/private subnet isolation

ArgoCD – Bcrypt-hashed admin password

TLS/HTTPS – Secure routing via NGINX Ingress

SARIF Integration – Security scan results appear in GitHub Security tab

# 🚀 Getting Started
Clone the repository.

Configure your AWS credentials and GitHub secrets.

Run the CI pipeline manually or via push to trigger builds.

Use Infra-dep.yaml to provision the infrastructure.

Access your QR code generator via the NGINX Ingress URL.

<p align="center">Made with ❤️ and a lot of ☕</p>
