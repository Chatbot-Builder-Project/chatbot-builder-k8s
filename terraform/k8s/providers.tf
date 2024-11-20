data "terraform_remote_state" "infra" {
  backend = "remote"

  config = {
    organization = "chatbot-builder"
    workspaces = {
      name = "infra-workspace"
    }
  }
}

provider "kubernetes" {
  host                   = data.terraform_remote_state.infra.outputs.kube_config.host
  client_certificate     = base64decode(data.terraform_remote_state.infra.outputs.kube_config.client_certificate)
  client_key             = base64decode(data.terraform_remote_state.infra.outputs.kube_config.client_key)
  cluster_ca_certificate = base64decode(data.terraform_remote_state.infra.outputs.kube_config.cluster_ca_certificate)
}