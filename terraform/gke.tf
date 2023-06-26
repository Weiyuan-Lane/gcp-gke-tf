
module "gke_cluster" {
  source = "./modules/gke_cluster"

  id                     = local.gke_cluster_id
  location               = local.project_region
  enable_service_account = false

  node_pool_configurations = {
    "standard-pool" : {
      min_node_count = 1
      max_node_count = 2
      preemptible    = false
      machine_type   = "e2-standard-2"
      taint = [
        {
          key : "key1"
          value : "value1"
          effect : "NO_SCHEDULE"
        }
      ]
      labels = {
        "label2" : "value2"
      }
    },
    "preemptible-pool" : {
      min_node_count = 1
      max_node_count = 2
      preemptible    = true
      machine_type   = "e2-standard-4"
      taint          = []
      labels         = {}
    }
  }
}
