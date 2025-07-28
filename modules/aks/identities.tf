resource "azurerm_user_assigned_identity" "aks_identity" {
  name                = "${var.environment}${random_pet.azurerm_kubernetes_cluster_name.id}-cluster-identity"
  resource_group_name = var.resource_group_name
  location            = var.location
}

resource "azurerm_user_assigned_identity" "aks_kubelet_identity" {
  name                = "${var.environment}${random_pet.azurerm_kubernetes_cluster_name.id}-kubelet-identity"
  resource_group_name = var.resource_group_name
  location            = var.location
}

resource "azurerm_user_assigned_identity" "aks_service_mesh_identity" {
  name                = "${var.environment}${random_pet.azurerm_kubernetes_cluster_name.id}-${var.service_mesh_type}-pod-identity"
  resource_group_name = var.resource_group_name
  location            = var.location
}

resource "azurerm_federated_identity_credential" "aks_service_mesh_identity" {
  name                = "istio-ingress-sa-identity"
  resource_group_name = var.resource_group_name
  audience            = ["api://AzureADTokenExchange"]
  issuer              = azurerm_kubernetes_cluster.k8s[0].oidc_issuer_url
  parent_id           = azurerm_user_assigned_identity.aks_service_mesh_identity.id
  subject             = "system:serviceaccount:aks-istio-ingress:istio-ingress-sa-identity"
}