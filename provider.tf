terraform {
  required_providers {
    kind = {
      source  = "tehcyx/kind"
      version = "~> 0.1.1"
    }
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = "1.14.0"
    }
  }
}

provider "kind" {}

provider "kubectl" {
  host                   = kind_cluster.default.endpoint
  cluster_ca_certificate = kind_cluster.default.cluster_ca_certificate
  client_certificate     = kind_cluster.default.client_certificate
  client_key             = kind_cluster.default.client_key
  load_config_file       = false
}

provider "kubernetes" {
  host                   = kind_cluster.default.endpoint
  cluster_ca_certificate = kind_cluster.default.cluster_ca_certificate
  client_certificate     = kind_cluster.default.client_certificate
  client_key             = kind_cluster.default.client_key
}

provider "helm" {
  kubernetes {
    host                   = kind_cluster.default.endpoint
    cluster_ca_certificate = kind_cluster.default.cluster_ca_certificate
    client_certificate     = kind_cluster.default.client_certificate
    client_key             = kind_cluster.default.client_key
  }
}
