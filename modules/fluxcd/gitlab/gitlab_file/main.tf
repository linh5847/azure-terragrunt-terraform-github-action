locals {
  yaml_files   = fileset("${path.module}/${var.file_path}", "*.yaml")
  yaml_content = { for file in local.yaml_files : file => file("${path.module}/${var.file_path}/${file}") }
}

resource "gitlab_repository_file" "yaml_files" {
  for_each       = local.yaml_content
  project        = var.project_id
  file_path      = "clusters/${var.flux_cluster_path}/${var.file_path}/${each.key}"
  content        = base64encode(each.value)
  author_name    = "Terraform"
  author_email   = "linh5847@gmail.com"
  commit_message = "added flux image configs"
  branch         = "main"
}