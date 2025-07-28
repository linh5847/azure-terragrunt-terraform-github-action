# ==========================================
# Construct KinD cluster
# ==========================================

resource "kind_cluster" "kind_k8s" {
  name           = "flux-e2e"
  wait_for_ready = true
  node_image     = "kindest/node:v1.31.1"

  kind_config {
    kind        = "Cluster"
    api_version = "kind.x-k8s.io/v1alpha4"

    node {
      role = "control-plane"
    }
    node {
      role = "worker"
      labels = {
        app = "springboot"
      }
    }
    node {
      role = "worker"
      labels = {
        app = "hello_world"
      }
    }
  }
}

data "gitlab_project" "gitlab" {
  path_with_namespace = "${var.gitlab_group}/${var.gitlab_project}"
}

# ==========================================
# Initialise a Gitlab project
# Require of a new gitlab repository or project
# ==========================================
/*
resource "gitlab_project" "this" {
  name                   = var.gitlab_project # group/subgroup/project-name
  description            = "flux-bootstrap"
  visibility_level       = "private"
  initialize_with_readme = true # This is extremely important as Flux expects an initialised repository
}
*/

# ==========================================
# Add deploy token to Gitlab repository
# ==========================================

resource "tls_private_key" "flux" {
  algorithm   = "ECDSA"
  ecdsa_curve = "P256"
}

resource "gitlab_deploy_key" "gitlab_deploy_key" {
  project  = data.gitlab_project.gitlab.id
  title    = "Flux"
  key      = tls_private_key.flux.public_key_openssh
  can_push = true
}

# ==========================================
# Bootstrap KinD cluster
# ==========================================

resource "flux_bootstrap_git" "flux_bootstrap" {
  depends_on = [gitlab_deploy_key.gitlab_deploy_key]

  embedded_manifests = true
  path               = "clusters/${var.flux_cluster_path}"
  components_extra   = ["image-reflector-controller", "image-automation-controller"]
}