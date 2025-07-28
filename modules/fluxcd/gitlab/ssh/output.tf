output "gitlab_namespace" {
  value = data.gitlab_project.gitlab.namespace_id
}

output "gitlab_name" {
  value = data.gitlab_project.gitlab.name
}

output "gitlab_url" {
  value = data.gitlab_project.gitlab.http_url_to_repo
}

output "k8s_name" {
  value = kind_cluster.kind_k8s.name
}

output "gitlab_project_id" {
  value = data.gitlab_project.gitlab.id
}