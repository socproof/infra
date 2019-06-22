provider "google" {
  project = "infra-244517"
  region  = "europe-west1"
}

resource "google_compute_instance" "app" {
  name         = "reddit-app"
  machine_type = "g1-small"
  zone         = "europe-west1-b"
  boot_disk {
    initialize_params {
      image = "reddit-base-1561224901"
    }
  }
  network_interface {
    network = "default"
    access_config {}
  }
  metadata = {
    sshKeys = "appuser:${file("~/.ssh/appuser.pub")}"
  }
  tags = ["reddit-app"]
  connection {
    host        = "${self.network_interface.0.access_config.0.nat_ip}"
    type        = "ssh"
    user        = "appuser"
    agent       = false
    private_key = "${file("~/.ssh/appuser")}"
  }
  provisioner "file" {
    source      = "files/puma.service"
    destination = "/tmp/puma.service"
  }
  provisioner "remote-exec" {
    script = "files/deploy.sh"
  }
}

resource "google_compute_firewall" "firewall_puma" {
  name    = "allow-puma-default"
  network = "default"
  allow {
    protocol = "tcp"
    ports    = ["9292"]
  }
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["reddit-app"]
}
