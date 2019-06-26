provider "google" {
  project = "${var.project}"
  region  = "${var.region}"
}

terraform {
  backend "gcs" {
    bucket = "terraform-2-home-work"
    prefix = "terraform/stage"
  }
}

module "app" {
  source          = "../modules/app"
  public_key_path = "${var.public_key_path}"
  app_disk_image  = "${var.app_disk_image}"
  name_suffix     = "stage"
}
module "db" {
  source          = "../modules/db"
  public_key_path = "${var.public_key_path}"
  db_disk_image   = "${var.db_disk_image}"
  name_suffix     = "stage"
}

module "vpc" {
  source        = "../modules/vpc"
  source_ranges = ["0.0.0.0/0"]
}
