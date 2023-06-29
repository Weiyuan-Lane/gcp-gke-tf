output "cluster_sa_id" {
  value       = google_service_account.cluster_sa.id
  description = "Cluster service account id"
}

output "cluster_sa_email" {
  value       = google_service_account.cluster_sa.email
  description = "Cluster service account email"
}
