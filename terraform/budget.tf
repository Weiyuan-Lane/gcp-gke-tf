resource "google_billing_budget" "budget" {
  billing_account = data.google_billing_account.account.id
  display_name    = "GKE cluster - ${var.gke_cluster_id} - Budget"

  amount {
    specified_amount {
      currency_code = var.budget_config.currency
      units         = var.budget_config.amount
    }
  }

  budget_filter {
    projects               = ["projects/${data.google_project.project.number}"]
    credit_types_treatment = "EXCLUDE_ALL_CREDITS" // Support values INCLUDE_ALL_CREDITS, EXCLUDE_ALL_CREDITS, INCLUDE_SPECIFIED_CREDITS
  }

  dynamic "threshold_rules" {
    for_each = var.budget_config.thresholds
    content {
      threshold_percent = threshold_rules.value.percent
      spend_basis       = threshold_rules.value.is_forecasted ? "FORECASTED_SPEND" : "CURRENT_SPEND"
    }
  }
}
