output "helm_release_name" {
  value = helm_release.helm_release.name
}

output "helm_release_id" {
  value = helm_release.helm_release.id
}

output "helm_release_manifest" {
  value = helm_release.helm_release.manifest
}