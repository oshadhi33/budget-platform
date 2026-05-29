resource "null_resource" "kind_cluster" {

  provisioner "local-exec" {
    command = <<EOT
cat <<EOF | kind create cluster --name budget-platform --config -
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
nodes:
  - role: control-plane
  - role: worker
EOF
EOT
  }

  provisioner "local-exec" {
    when    = destroy
    command = "kind delete cluster --name budget-platform"
  }
}
