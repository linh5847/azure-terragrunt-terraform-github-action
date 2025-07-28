locals {
  global_vars = read_terragrunt_config(find_in_parent_folders("global.hcl"))

  # Automatically load account-level variables
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))

  # Automatically load region-level variables
  region_vars = read_terragrunt_config(find_in_parent_folders("region.hcl"))

  # Extract the variables we need for easy access
  project_name = local.global_vars.locals.project_name
  #account_id   = local.account_vars.locals.aws_account_id
  azure_region = local.region_vars.locals.azure_region
  environment  = local.account_vars.locals.environment

  # Default used globally by each resource
  default_tags = {
    Terraform   = "true"
    Environment = local.environment
  }
}

# Generate an AWS provider block
generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
  terraform {
    required_providers {
      azurerm = {
        source  = "hashicorp/azurerm"
        version = ">=4.32.0"
      }
    }
  }
  provider "azurerm" {
    features {
      resource_group {
        prevent_deletion_if_contains_resources = false
      }
    }
  }
EOF
}

# Configure Terragrunt to automatically store tfstate files in an Azure StorageAccount
remote_state {
  backend = "azurerm"
  config = {
    resource_group_name  = "vntechsol"
    storage_account_name = "vntechsolacc"
    container_name       = "vntechsolcon"
    key                  = "${path_relative_to_include()}/terraform.tfstate"
    access_key           = "yEx1Z8QuCcrbGXs+NXmPW742N47RYTU6ioNFdF9rxmxFQG51vB0sKDIwfqlQJY2lx9oZSHqiGmhv+AStYNfMJQ=="
  }
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
}

# ---------------------------------------------------------------------------------------------------------------------
# GLOBAL PARAMETERS
# These variables apply to all configurations in this subfolder. These are automatically merged into the child
# `terragrunt.hcl` config via the include block.
# ---------------------------------------------------------------------------------------------------------------------

# Configure root level variables that all resources can inherit. This is especially helpful with multi-account configs
# where terraform_remote_state data sources are placed directly into the modules.
inputs = merge(
  local.account_vars.locals,
  local.region_vars.locals,
  local.global_vars.locals
)
