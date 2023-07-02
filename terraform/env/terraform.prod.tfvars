project_id              = ""
project_region          = ""
project_billing_account = ""

gke_cluster_id = "test-cluster"
budget_config = {
  amount   = 0
  currency = ""
  
  thresholds = [
    {
      percent = 0
      is_forecasted = false
    }
  ]
}