output "gitlab_project_commit_id" {
  value = values(gitlab_repository_file.yaml_files).*.commit_id
}

output "gitlab_project_branch" {
  value = values(gitlab_repository_file.yaml_files)[*].branch
}