variable "cluster_id" {
  description = "(Required) Cluster id"
  type        = string
  nullable    = false
}

variable "cluster_kubeconfig" {
  description = "(Required) Kubeconfig for running kubectl commands"
  type        = string
  nullable    = false
}

