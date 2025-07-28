output "log_analytics_workspace_id" {
  value = azurerm_log_analytics_workspace.log_analytic_workspace[0].id
}

output "log_analytics_workspace_location" {
  value = azurerm_log_analytics_workspace.log_analytic_workspace[0].location
}

output "log_analytics_workspace_name" {
  value = azurerm_log_analytics_workspace.log_analytic_workspace[0].name
}

output "log_analytics_workspace_resource_group_name" {
  value = azurerm_log_analytics_workspace.log_analytic_workspace[0].resource_group_name
}