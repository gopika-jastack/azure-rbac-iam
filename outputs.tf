output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "user_name" {
  value = azuread_user.cloud_user.user_principal_name
}

output "group_name" {
  value = azuread_group.cloud_admins.display_name
}

output "role_assigned" {
  value = "Contributor"
}
