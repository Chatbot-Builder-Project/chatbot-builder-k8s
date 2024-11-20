output "kube_config" {
  value     = azurerm_kubernetes_cluster.aks.kube_config[0]
  sensitive = true
}

output "cluster_name" {
  value = azurerm_kubernetes_cluster.aks.name
}

output "identity" {
  value = azurerm_kubernetes_cluster.aks.identity
}