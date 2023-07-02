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

variable "project_billing_account" {
  type        = string
  nullable    = false
  description = "(Required) Billing account for GCP Project"
}

variable "gke_cluster_id" {
  type        = string
  nullable    = false
  description = "(Required) GKE Cluster ID intended for identifying the GKE cluster in cloud console. Also reused for GKE Cluster's SA ID, and budget"
}

# For budget_config, it contains all budget configurations
#
#   - amount     - Amount for this budget in its relevant currency amount
#   - currency   - Currency to be used - IMPORTANT - this must be the right currency based on your billing account
#   - thresholds - At least one threshold to be set with the following information
#       - percent       - 1.0-based percentage for threshold before budget alert is triggered
#       - is_forecasted - Trigger alert for budget based on budgeted value, or currently charged values
#
variable "budget_config" {
  description = "Budget configuration"
  nullable    = false

  type = object({
    amount   = number
    currency = string

    thresholds = list(object({
      percent       = number
      is_forecasted = bool
    }))
  })

  validation {
    condition     = var.budget_config.amount >= 0
    error_message = "Budget must be bigger or equal to 0, and it cannot be negative"
  }

  validation {
    condition     = length(var.budget_config.thresholds) > 0
    error_message = "At least one budget threshold must be declared"
  }

  validation {
    condition = alltrue([
      for o in var.budget_config.thresholds : o.percent > 0
    ])
    error_message = "Budget threshold must be bigger than 0"
  }

  validation {
    condition = alltrue([
      for o in var.budget_config.thresholds : o.is_forecasted != null
    ])
    error_message = "Budget threshold \"is_forecasted\" value is a boolean and cannot be null"
  }
}
