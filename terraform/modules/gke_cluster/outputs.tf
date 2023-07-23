output "cluster_sa_id" {
  value       = google_service_account.cluster_sa.id
  description = "Cluster service account id"
}

output "cluster_sa_email" {
  value       = google_service_account.cluster_sa.email
  description = "Cluster service account email"
}

output "cluster_id" {
  value       = google_container_cluster.main.id
  description = "Cluster id"
}

output "cluster_kubeconfig" {
  value       = local.kubeconfig
  description = "Cluster kubeconfig - essential for other applications"
}
