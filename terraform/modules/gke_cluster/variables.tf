variable "id" {
  description = "(Required) Unique Identifier, used for cluster id and for other purposes, like service account"
  type        = string
  nullable    = false

  validation {
    condition     = can(regex("[0-9a-zA-Z]+", var.id))
    error_message = "ID must have only alphanumeric characters or dash character, with at least one character"
  }
}

variable "location" {
  description = "(Required) Cluster location - as defined in GCP. See here for more details: https://cloud.google.com/compute/docs/regions-zones"
  type        = string
  nullable    = false
}

variable "enable_service_account" {
  description = "If set to true, it will create service account for cluster"
  type        = bool
  default     = false
}

variable "node_pool_configurations" {
  description = "(Required) List of node pool configurations"
  nullable    = false

  type = map(object({
    min_node_count = number
    max_node_count = number
    preemptible    = bool
    machine_type   = string
  }))
}
