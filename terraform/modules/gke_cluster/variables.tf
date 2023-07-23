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

variable "vpc_name" {
  description = "VPC name to be used for Cluster"
  type        = string
  default     = null
}

variable "subnet_name" {
  description = "VPC subnet name to be used for Cluster"
  type        = string
  default     = null
}

variable "enable_service_account" {
  description = "If set to true, it will create service account for cluster"
  type        = bool
  default     = false
}

variable "autoscaling_config" {
  description = "(Required) Autoscaling configuration"
  nullable    = false

  type = object({
    cpu = object({
      minimum = number
      maximum = number
    }),
    memory = object({
      minimum = number
      maximum = number
    })
  })

  validation {
    condition     = var.autoscaling_config.memory.maximum > var.autoscaling_config.memory.minimum
    error_message = "Maximum amount should be higher than minimum amount"
  }

  validation {
    condition     = var.autoscaling_config.cpu.maximum > var.autoscaling_config.cpu.minimum
    error_message = "Maximum amount should be higher than minimum amount"
  }
}

# For node_pool_config, it contains a list of pool configurations
#
#   - min_node_count - minimum node count to scale to
#   - max_node_count - maximum node count to scale to
#   - preemptible    - if the node type is preemptible
#   - machine_type   - the desired machine type - see here for more: https://cloud.google.com/compute/docs/machine-resource
#
# Multiple pools can be configured to achieve bin-packing in different configurations
variable "node_pool_config" {
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
