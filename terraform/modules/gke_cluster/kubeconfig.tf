
data "google_client_config" "default" {
}

locals {
  kubeconfig = yamlencode({
    apiVersion      = "v1"
    kind            = "Config"
    current-context = "terraform"
    preferences     = {}
    clusters = [{
      name = google_container_cluster.main.id
      cluster = {
        certificate-authority-data = google_container_cluster.main.master_auth.0.cluster_ca_certificate
        server                     = "https://${google_container_cluster.main.endpoint}"
      }
    }]
    contexts = [{
      name = "terraform"
      context = {
        cluster = google_container_cluster.main.id
        user    = "terraform"
      }
    }]
    users = [{
      name = "terraform"
      user = {
        token = data.google_client_config.default.access_token
      }
    }]
  })
}
