
resource "htpasswd_password" "argo_pass" {
  password = var.argo_pass
}


resource "helm_release" "argocd" {
  depends_on = [module.eks]
  name       = "argocd"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  version    = "4.5.2"

  namespace = "argocd"

  create_namespace = true

  set = [
  {
    name = "server.ingress.enabled"
    value = "true"
  },
  {
    name  = "server.service.type"
    value = "ClusterIP"  
  },
  {
    name = "configs.params.server\\.insecure"
    value = "true"
  },
  {
    name = "server.ingress.ingressClassName"
    value = "nginx"
  },
  
  {
  name  = "configs.secret.argocdServerAdminPassword"
  value = htpasswd_password.argo_pass.password  # BCrypt hash of password
  }
    
 ]
}