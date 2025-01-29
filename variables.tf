variable "GOOGLE_CREDENTIALS" {
  type        = string
  default     = "terraform/keys/gcp.json"
  description = "Path to google credential"
}

variable "project" {
  type        = string
  default     = "august-sandbox-425102-m1"
  description = "Name of the project on GCP"
}

variable "region" {
  type        = string
  default     = "us-central1"
  description = "Region"
}

variable "google_storage_bucket_name" {
  type        = string
  default     = "august-sandbox-425102-m1-terra-bucket"
  description = "Google Storage Bucket Name"
}

variable "location" {
  type        = string
  default     = "US"
  description = "Location"
}

variable "google_bigquery_dataset_name" {
  type        = string
  default     = "datazoomcamp2025"
  description = "Name of BQ Dataset"
}

variable "vm_name" {
  type        = string
  default     = "data-zoomcamp"
  description = "Virtual Machine Name"
}


variable "vm_zone" {
  type        = string
  default     = "us-central1-a"
  description = "Virtual Machine Zone"
}


variable "vm_machine_type" {
  type        = string
  default     = "e2-standard-4"
  description = "Virtual Machine Type"
}

variable vm_image_size {
  default     = 30
  description = "VM Image Size"
}
