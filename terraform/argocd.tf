resource "helm_release" "argocd" {
  provider = helm.eks

  name       = "argocd"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  namespace  = "argocd"
  create_namespace = true
  version    = "9.2.4" # Specify a version for consistency

  set {
    name  = "configs.secret.argocdServerAdminPassword"
    value = var.argocd_admin_password_hash
  }

  set {
    name  = "server.service.type"
    value = "ClusterIP"
  }

  set {
    name  = "configs.params.server.insecure"
    value = "true"
  }

  set {
    name  = "server.ingress.enabled"
    value = "true"
  }

  set {
    name  = "server.ingress.ingressClassName"
    value = "nginx"
  }

  set {
    name  = "server.ingress.path"
    value = "/argocd"
  }

  set {
    name  = "configs.params.server.basehref"
    value = "/argocd"
  }

  set {
    name  = "configs.params.server.rootpath"
    value = "/argocd"
  }

  set {
    name = "global.domain"
    value = ""
  } 

  depends_on = [
    helm_release.ingress_nginx
  ]
}