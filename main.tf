terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.17.0"
    }
  }
}

provider "google" {
  credentials = file(var.GOOGLE_CREDENTIALS)
  project     = var.project
  region      = var.region
}

resource "google_storage_bucket" "auto-expire" {
  name          = var.google_storage_bucket_name
  location      = var.location
  force_destroy = true

  lifecycle_rule {
    condition {
      age = 1
    }
    action {
      type = "AbortIncompleteMultipartUpload"
    }
  }
}

resource "google_bigquery_dataset" "dataset" {
  dataset_id    = var.google_bigquery_dataset_name
  friendly_name = "Data Zoomcamp"
  description   = "This is a dataset created by terraform"
  location      = var.location
}


data "google_compute_image" "ubuntu" {
  family  = "ubuntu-2004-lts"
  project = "ubuntu-os-cloud"  # Use the Ubuntu project
}

resource "google_compute_instance" "default" {
  name         = var.vm_name
  machine_type = var.vm_machine_type
  zone         = var.vm_zone

  boot_disk {
    initialize_params {
      image = data.google_compute_image.ubuntu.self_link
      size = 30
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral public IP
    }
  }

}