output "kind_cluster_name" {
  value = kind_cluster.kind_k8s.name
}

output "tls_private_key" {
  value = tls_private_key.tls_key.private_key_pem
}

output "endpoint" {
  value = kind_cluster.kind_k8s.endpoint
}

output "client_certificate" {
  value = kind_cluster.kind_k8s.client_certificate
}

output "client_key" {
  value = kind_cluster.kind_k8s.client_key
}

output "cluster_ca_certificate" {
  value = kind_cluster.kind_k8s.cluster_ca_certificate
}