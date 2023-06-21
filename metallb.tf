data "external" "kind_network_inspect" {
  depends_on = [kind_cluster.default]
  program    = ["bash", "get_docker_network_ip.sh"]
}

resource "helm_release" "metallb" {
  depends_on = [kind_cluster.default]
  name       = "metallb"

  repository       = "https://charts.bitnami.com/bitnami"
  chart            = "metallb"
  namespace        = "metallb"
  version          = "4.5.1"
  create_namespace = true
}

resource "kubectl_manifest" "kind_address_pool" {
  depends_on = [helm_release.metallb]
  yaml_body  = <<YAML
apiVersion: metallb.io/v1beta1
kind: IPAddressPool
metadata:
  name: main-address
  namespace: metallb
spec:
  addresses:
  - ${data.external.kind_network_inspect.result.Subnet}
YAML
}
