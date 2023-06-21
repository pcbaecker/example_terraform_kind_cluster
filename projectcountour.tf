resource "helm_release" "projectcontour" {
  depends_on = [kind_cluster.default]
  name       = "contour"

  repository       = "https://charts.bitnami.com/bitnami"
  chart            = "contour"
  namespace        = "projectcontour"
  version          = "12.1.0"
  create_namespace = true
}