resource "null_resource" "init" {
  depends_on = [null_resource.configure_kubectl]

  provisioner "local-exec" {
    command = "echo 'Minikube cluster is ready for Helm deployments'"
  }
}
