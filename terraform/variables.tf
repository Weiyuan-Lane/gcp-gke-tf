variable "project_id" {
  type        = string
  nullable    = false
  description = "(Required) GCP Project ID to run this terraform project"
}

variable "project_region" {
  type        = string
  nullable    = false
  description = "(Required) GCP Region to run this terraform project"
}

variable "gke_cluster_id" {
  type        = string
  nullable    = false
  description = "(Required) GKE Cluster ID intended for identifying the cluster in cloud console"
}
