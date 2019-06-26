variable app_disk_image {
  description = "Disk image for reddit app"
  default     = "reddit-app-base"
}
variable public_key_path {
  description = "Path to the public key used for ssh access"
}
variable name_suffix {
  description = "Suffix to instance name"
  default     = "prod"
}
