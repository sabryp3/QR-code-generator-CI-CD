resource "helm_release" "argocd" {
  provider = helm.eks

  name       = "argocd"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  namespace  = "argocd"
  create_namespace = true
  version    = "6.7.15" # Specify a version for consistency

  set = [
    {
    name  = "configs.secret.argocdServerAdminPassword"
    value = var.argocd_admin_password_hash
  },

   {
    name  = "server.service.type"
    value = "ClusterIP"
  },

  {
    name  = "configs.params.server.insecure"
    value = "true"
  },

   {
    name  = "server.ingress.enabled"
    value = "true"
  },

   {
    name  = "server.ingress.ingressClassName"
    value = "nginx"
  }, 

   {
    name  = "server.ingress.paths[0]"
    value = "/argocd"
  },

   {
    name  = "configs.params.server.basehref"
    value = "/argocd"
  },

   {
    name  = "configs.params.server.rootpath"
    value = "/argocd"
  }
 ]
 
  depends_on = [
    helm_release.ingress_nginx
  ]
}
