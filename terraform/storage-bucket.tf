provider "google" {
 version = "1.4.0"
 project = "${var.project}"
 region = "${var.region}"
}
module "storage-bucket" {
 source = "SweetOps/storage-bucket/google"
 version = "0.1.1"
 name = ["storage-bucket-shomrin", "storage-bucket-shomrin2"]
}
output storage-bucket_url {
 value = "${module.storage-bucket.url}"
}
