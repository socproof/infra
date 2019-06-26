variable db_disk_image {
  description = "Disk image for reddit DB"
  default     = "reddit-db-base"
}

variable public_key_path {
  description = "Path to the public key used for ssh access"
}

variable name_suffix {
  description = "Suffix to instance name"
  default     = "prod"
}
