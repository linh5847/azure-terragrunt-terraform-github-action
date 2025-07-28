resource "helm_release" "helm_release" {
  name             = var.name
  repository       = var.repository
  chart            = var.chart
  version          = var.chart_version
  upgrade_install  = var.upgrade_install
  force_update     = var.force_update
  skip_crds        = var.skip_crds
  lint             = var.lint
  max_history      = var.max_history
  cleanup_on_fail  = var.cleanup_on_fail
  create_namespace = var.create_namespace
  namespace        = var.namespace
  timeout          = var.timeout
  wait             = true
  verify           = true

  values = var.values

  dynamic "set" {
    iterator = item
    for_each = var.set == null ? [] : var.set

    content {
      name  = item.value.name
      value = item.value.value
      type  = item.value.type
    }
  }

  dynamic "set_list" {
    iterator = item
    for_each = var.set_list == null ? [] : var.set_list

    content {
      name  = item.value.name
      value = item.value.value
    }
  }

  dynamic "set_sensitive" {
    iterator = item
    for_each = var.set_sensitive == null ? [] : var.set_sensitive

    content {
      name  = item.value.name
      value = item.value.value
      type  = item.value.type
    }
  }

  lifecycle {
    create_before_destroy = true
  }

}