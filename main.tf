provider "google" {
  credentials = ".credentials.json"
  project     = "huta99"
  region      = "us-central1"
  zone        = "us-central1-c"
}


resource "random_string" "random_str" {
  length  = 8
  upper   = false
  special = false
}
