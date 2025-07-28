resource "azurerm_log_analytics_solution" "log_analytics_solution" {
  count = var.log_analytics_solution_enabled ? 1 : 0

  location              = var.location
  resource_group_name   = var.resource_group_name
  solution_name         = var.solution_name
  workspace_name        = var.log_analytics_workspace_name
  workspace_resource_id = var.log_analytics_workspace_id

  tags = merge(
    {
      "Name" = format("%s", var.solution_name)
    },
    var.additional_tags,
  )

  plan {
    product   = "OMSGallery/ContainerInsights"
    publisher = "Microsoft"
  }
}