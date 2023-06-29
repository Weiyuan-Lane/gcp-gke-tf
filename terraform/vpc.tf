# VPC for cluster
resource "google_compute_network" "gke_cluster_vpc" {
  name                    = "${var.gke_cluster_id}-vpc"
  auto_create_subnetworks = "false"
}

resource "google_compute_subnetwork" "gke_cluster_subnet" {
  name          = "${var.gke_cluster_id}-subnet"
  region        = var.project_region
  network       = google_compute_network.gke_cluster_vpc.name
  ip_cidr_range = "10.10.0.0/24"
}
