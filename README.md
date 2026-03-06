📋 # Project Overview
QR code generator application with CI/CD pipeline
Frontend (NextJS), Backend (Python FastAPI), Infrastructure (AWS EKS)
📁 Repository Layout
api/ - Python FastAPI backend
front-end-nextjs/ - NextJS frontend
terraform/ - Infrastructure as Code
.github/workflows/ - CI/CD pipelines
argocd/ - GitOps configuration
qr-helm/ - Kubernetes Helm charts
✨ Features
QR code generation from URLs
Web-based user interface
AWS S3 cloud storage integration
Kubernetes-based deployment
GitOps workflow with ArgoCD
Infrastructure as Code with Terraform
Automated monitoring with Prometheus/Grafana
🛠️ Technologies
Frontend: Next.js, Node.js 24
Backend: Python 3.12, FastAPI
Infrastructure: AWS (EKS, VPC, S3)
CI/CD: GitHub Actions
Containerization: Docker, Docker Buildx
IaC: Terraform ~1.0
Orchestration: Kubernetes, Helm
Monitoring: Prometheus, Grafana
Ingress: NGINX
GitOps: ArgoCD
✅ Prerequisites
AWS Account with IAM permissions
Terraform >= 1.0
kubectl configured
Docker installed
GitHub Actions enabled
Environment variables (S3_BUCKET_NAME, AWS_REGION, EKS_CLUSTER, etc.)
Secrets configured (SONAR_TOKEN, DOCKERHUB_TOKEN, AWS_ROLE_ARN, ARGOCD_ADMIN_PASSWORD)
🔄 CI/CD Pipeline Workflows
1. CI.yml - Build & Push Docker Images

Code quality analysis with SonarQube
Python API testing with pytest
Docker image builds (API & Frontend)
Trivy vulnerability scanning
Push to Docker Hub with git commit tags
2. Infra-dep.yaml - Provision Infrastructure

Terraform validation and planning
IaC security scanning with Trivy
EKS cluster provisioning
VPC and networking setup
NGINX Ingress Controller installation
ArgoCD deployment via Helm
Cluster Autoscaler setup
Monitoring stack (Prometheus/Grafana)
Kubernetes connectivity verification
3. infra-del.yaml - Destroy Infrastructure

Clean up LoadBalancer namespaces
Terraform state management
Infrastructure destruction with cleanup
🔒 Security Features
Code Quality: SonarQube analysis via SonarCloud
Container Scanning: Trivy for Docker images (CRITICAL/HIGH severity)
IaC Security: Trivy scanning of Terraform configurations
Secret Management: GitHub Secrets for sensitive data
AWS IAM: Role-based access with IRSA (IAM Roles for Service Accounts)
RBAC: Kubernetes Role-Based Access Control
Network Security: VPC with public/private subnets
Password Protection: Bcrypt-hashed ArgoCD credentials
TLS/HTTPS: NGINX Ingress with secure routing
SARIF Integration: Security scan results in GitHub Security tab
