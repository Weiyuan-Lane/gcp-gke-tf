
resource "null_resource" "apply" {
  # Trigger when either cluster config changes (kubeconfig), kubernetes-dashboard.yaml changes, or cmd to run changes
  triggers = {
    cluster_id         = var.cluster_id
    yaml_configuration = sha1(file("${path.module}/kubernetes-dashboard.yaml"))

    # Additional apply process substitution with "<()" - https://www.gnu.org/software/bash/manual/html_node/Process-Substitution.html#Process-Substitution
    cmd = <<-EOT
      kubectl apply -f ${path.module}/kubernetes-dashboard.yaml --kubeconfig <(echo $BASE64_KUBECONFIG | base64 --decode)
    EOT
  }

  provisioner "local-exec" {
    interpreter = ["/bin/bash", "-c"]
    environment = {
      BASE64_KUBECONFIG = base64encode(var.cluster_kubeconfig) # Encode and decode later to preserve indentation of yamlconfig
    }
    command = self.triggers.cmd
  }
}
