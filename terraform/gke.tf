# GKE Cluster implementation
module "gke_cluster" {
  source = "./modules/gke_cluster"

  id                     = var.gke_cluster_id
  location               = var.project_region
  enable_service_account = true
  vpc_name               = google_compute_network.gke_cluster_vpc.name
  subnet_name            = google_compute_subnetwork.gke_cluster_subnet.name

  autoscaling_config = {
    cpu : {
      minimum = 1
      maximum = 10
    },
    memory : {
      minimum = 2
      maximum = 20
    }
  }

  node_pool_config = {
    "standard-pool" : {
      min_node_count = 1
      max_node_count = 2
      preemptible    = false
      machine_type   = "e2-standard-4"
      taint          = []
      labels = {
        "label2" : "value2"
      }
    },
    "preemptible-pool" : {
      min_node_count = 0
      max_node_count = 2
      preemptible    = true
      machine_type   = "e2-standard-4"
      taint          = []
      labels         = {}
    }
  }
}
