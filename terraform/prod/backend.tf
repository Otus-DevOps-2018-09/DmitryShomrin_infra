terraform {
  backend "gcs" {
    bucket = "storage-bucket-shomrin"
    prefix = "terraform"
  }
}
