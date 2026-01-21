resource "helm_release" "kube_prometheus_stack" {
  provider = helm.eks
  name       = "prometheus-stack"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "kube-prometheus-stack"
  version    = "80.14.2"  
  namespace  = "monitoring"
  
  # Create namespace if it doesn't exist
  create_namespace = true

  values = [
    <<-EOT
    # Global configuration
    global:
      rbac:
        create: true
    
    # Prometheus configuration
    prometheus:
      enabled: true
      service:
        type: ClusterIP 
      ingress:
        enabled: true
        ingressClassName: "nginx"     
        hosts:
          - ""
        paths:
          - "/prometheus"
        annotations:
          nginx.ingress.kubernetes.io/rewrite-target: /

    # Grafana configuration
    grafana:
      enabled: true
      adminUser: "admin"
      adminPassword: "admin123"  
      service:
        type: ClusterIP
      ingress:
        enabled: true
        ingressClassName: "nginx" 
        annotations:
            nginx.ingress.kubernetes.io/rewrite-target: /
        hosts:
          - ""
        paths:
          - "/grafana"
    EOT
  ]
  depends_on = [ module.eks ]
}