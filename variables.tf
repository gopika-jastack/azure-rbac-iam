variable "location" {
  default = "UK South"
}

variable "resource_group_name" {
  default = "rg-rbac-demo"
}

variable "user_password" {
  sensitive = true
}
