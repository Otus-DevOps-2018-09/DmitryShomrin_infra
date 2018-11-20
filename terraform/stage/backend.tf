terraform {
  backend "gcs" {
    bucket = "storage-bucket-shomrin2"
    prefix = "terraform"
  }
}
