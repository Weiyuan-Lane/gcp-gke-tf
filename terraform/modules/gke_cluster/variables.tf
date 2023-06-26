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

# For node_pool_configurations, it contains a list of pool configurations
#
#   - min_node_count - minimum node count to scale to
#   - max_node_count - maximum node count to scale to
#   - preemptible    - if the node type is preemptible
#   - machine_type   - the desired machine type - see here for more: https://cloud.google.com/compute/docs/machine-resource
#
# Multiple pools can be configured to achieve bin-packing in different configurations
variable "node_pool_configurations" {
  description = "(Required) List of node pool configurations"
  nullable    = false

  type = map(object({
    min_node_count = number
    max_node_count = number
    preemptible    = bool
    machine_type   = string
    labels         = map(string)

    taint = list(object({
      key    = string
      value  = string
      effect = string
    }))
  }))
}
