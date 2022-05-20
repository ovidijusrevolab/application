data "kubectl_path_documents" "manifests" {
  pattern = "${path.module}/files/manifest.yaml"
}

resource "kubectl_manifest" "manifests" {
  count     = length(data.kubectl_path_documents.manifests.documents)
  yaml_body = element(data.kubectl_path_documents.manifests.documents, count.index)
}
