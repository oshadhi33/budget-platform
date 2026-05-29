resource "null_resource" "start_minikube" {

  provisioner "local-exec" {
    command = <<EOT
minikube start --profile=${var.cluster_name} --driver=${var.driver}
EOT
  }
}

resource "null_resource" "enable_addons" {

  depends_on = [null_resource.start_minikube]

  provisioner "local-exec" {
    command = <<EOT
minikube addons enable ingress --profile=${var.cluster_name}
minikube addons enable metrics-server --profile=${var.cluster_name}
minikube addons enable dashboard --profile=${var.cluster_name}
EOT
  }
}

resource "null_resource" "configure_kubectl" {

  depends_on = [null_resource.enable_addons]

  provisioner "local-exec" {
    command = <<EOT
minikube update-context --profile=${var.cluster_name}
kubectl get nodes
EOT
  }
}
