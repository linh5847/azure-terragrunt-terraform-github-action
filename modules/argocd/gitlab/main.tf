terraform {
  #backend "local" {}
  required_providers {
    gitlab = {
      source  = "gitlabhq/gitlab"
      version = ">= 15.10.0"
    }
    kind = {
      source  = "tehcyx/kind"
      version = ">= 0.8.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.17.0"
    }
  }
  required_version = ">= 1.7.0"
}

provider "gitlab" {
  token = var.gitlab_token
}

resource "kind_cluster" "kind_k8s" {
  name           = var.k8s_name
  wait_for_ready = true
  node_image     = "kindest/node:${var.k8s_version}"

  kind_config {
    kind        = "Cluster"
    api_version = "kind.x-k8s.io/v1alpha4"

    node {
      role = "control-plane"
    }
    node {
      role = "worker"
      labels = {
        app = var.k8s_node_label
      }
    }
    node {
      role = "worker"
      labels = {
        app = var.k8s_extra_node_label
      }
    }
  }
}

data "gitlab_project" "gitlab" {
  path_with_namespace = "${var.gitlab_group}/${var.gitlab_project}"
}

resource "tls_private_key" "tls_key" {
  algorithm   = "ECDSA"
  ecdsa_curve = "P256"
}

resource "gitlab_deploy_key" "gitlab_deploy_key" {
  project  = data.gitlab_project.gitlab.id
  title    = "argocd"
  key      = tls_private_key.tls_key.public_key_openssh
  can_push = true
}

provider "helm" {
  kubernetes {
    host                   = kind_cluster.kind_k8s.endpoint
    cluster_ca_certificate = kind_cluster.kind_k8s.cluster_ca_certificate
    client_certificate     = kind_cluster.kind_k8s.client_certificate
    client_key             = kind_cluster.kind_k8s.client_key
  }
}

resource "time_sleep" "wait_150_seconds" {
  depends_on = [kind_cluster.kind_k8s, gitlab_deploy_key.gitlab_deploy_key]

  create_duration = "150s"
}

resource "helm_release" "argocd" {
  name       = "argocd"
  depends_on = [time_sleep.wait_150_seconds]

  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argo-cd"
  namespace        = "argocd"
  version          = "4.5.2"
  create_namespace = true
  force_update     = true
  lint             = true
  cleanup_on_fail  = true
  wait             = true
  /*
  set {
    name  = "type"
    value = "LoadBalancer"
  }
  
  set {
    name  = "server.service.annotations.service\\.beta\\.kubernetes\\.io/aws-load-balancer-type"
    value = "nlb"
  }
*/
}

data "kubernetes_service" "argocd_server" {

  metadata {
    name      = "argocd-server"
    namespace = helm_release.argocd.namespace
  }
}