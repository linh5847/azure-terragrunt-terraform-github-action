locals {
  allowed_ip_range = ["${chomp(data.http.myip.response_body)}/32"]

  auto_scaler_profile_scale_down_delay_after_delete = var.auto_scaler_profile_scale_down_delay_after_delete == null ? var.auto_scaler_profile_scan_interval : var.auto_scaler_profile_scale_down_delay_after_delete
}