resource "null_resource" "setup" {
  depends_on = [null_resource.kind_cluster]

  provisioner "local-exec" {
    command = "kubectl get nodes"
  }
}
