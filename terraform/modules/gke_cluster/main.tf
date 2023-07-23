

resource "google_service_account" "cluster_sa" {
  account_id   = "${var.id}-service-account"
  display_name = "GKE Cluster \"${var.id}\"'s Service Account"
  disabled     = !var.enable_service_account
}

resource "google_container_cluster" "main" {
  name       = var.id
  location   = var.location
  network    = var.vpc_name
  subnetwork = var.subnet_name

  # A cluster must always have a node pool. In order to customize our own node
  # pool, we need to add a small instance and immediately remove the default 
  # pool
  remove_default_node_pool = true
  initial_node_count       = 1

  cluster_autoscaling {
    enabled = true

    resource_limits {
      resource_type = "cpu"
      minimum       = var.autoscaling_config.cpu.minimum
      maximum       = var.autoscaling_config.cpu.maximum
    }
    resource_limits {
      resource_type = "memory"
      minimum       = var.autoscaling_config.memory.minimum
      maximum       = var.autoscaling_config.memory.maximum
    }
  }
}

resource "google_container_node_pool" "node_pool" {
  for_each = var.node_pool_config

  name     = "${var.id}-pool-${each.key}"
  location = var.location
  cluster  = google_container_cluster.main.name

  autoscaling {
    min_node_count = each.value.min_node_count
    max_node_count = each.value.max_node_count
  }

  upgrade_settings {
    max_surge       = 1
    max_unavailable = 0
  }

  node_config {
    preemptible  = each.value.preemptible
    machine_type = each.value.machine_type
    taint        = each.value.taint
    labels       = each.value.labels

    service_account = var.enable_service_account ? google_service_account.cluster_sa.email : ""

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}
