provider "google" {
  project               = var.project_id
  billing_project       = var.project_id
  region                = var.project_region
  user_project_override = true
}

data "google_project" "project" {
  project_id = var.project_id
}

data "google_billing_account" "account" {
  billing_account = var.project_billing_account
}
