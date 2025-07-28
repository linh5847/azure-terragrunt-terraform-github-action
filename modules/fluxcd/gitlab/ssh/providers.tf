terraform {
  required_providers {
    flux = {
      source  = "fluxcd/flux"
      version = ">= 1.5"
    }
    gitlab = {
      source  = "gitlabhq/gitlab"
      version = ">=15.10.0"
    }
    kind = {
      source  = "tehcyx/kind"
      version = ">= 0.8"
    }
  }
}

provider "flux" {
  kubernetes = {
    host                   = kind_cluster.kind_k8s.endpoint
    client_certificate     = kind_cluster.kind_k8s.client_certificate
    client_key             = kind_cluster.kind_k8s.client_key
    cluster_ca_certificate = kind_cluster.kind_k8s.cluster_ca_certificate
  }
  git = {
    url = "ssh://git@gitlab.com/${data.gitlab_project.gitlab.path_with_namespace}.git"
    ssh = {
      username    = "git"
      private_key = tls_private_key.flux.private_key_pem
    }
  }
}