resource "azurerm_log_analytics_workspace" "log_analytic_workspace" {
  count = var.log_analytics_workspace_enabled ? 1 : 0

  location            = var.location
  name                = var.cluster_log_analytics_workspace_name
  resource_group_name = var.resource_group_name
  retention_in_days   = var.log_retention_in_days
  sku                 = var.log_analytics_workspace_sku

  tags = merge(
    {
      "Name" = var.cluster_log_analytics_workspace_name
    },
    var.additional_tags,
  )

  lifecycle {
    precondition {
      condition     = can(var.cluster_log_analytics_workspace_name)
      error_message = "You must set one of `var.cluster_log_analytics_workspace_name` to create `azurerm_log_analytics_workspace.main`."
    }
  }
}