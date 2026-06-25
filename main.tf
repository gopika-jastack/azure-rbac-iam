terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }

    azuread = {
      source  = "hashicorp/azuread"
      version = "~>2.47"
    }
  }
}

provider "azurerm" {
  features {}
}

provider "azuread" {
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

# Azure AD User

resource "azuread_user" "cloud_user" {
  user_principal_name = "cloud.engineer.demo@simplilearnhol100552.onmicrosoft.com"
  display_name        = "Cloud Engineer Demo"
  password            = "Password@123456"
}

# Azure AD Security Group

resource "azuread_group" "cloud_admins" {
  display_name     = "CloudAdmins"
  security_enabled = true
}

# Add User to Group

resource "azuread_group_member" "group_member" {
  group_object_id  = azuread_group.cloud_admins.id
  member_object_id = azuread_user.cloud_user.id
}

# Assign Contributor Role to Group

resource "azurerm_role_assignment" "contributor" {
  scope                = azurerm_resource_group.rg.id
  role_definition_name = "Contributor"
  principal_id         = azuread_group.cloud_admins.object_id
}
