resource "garage_bucket" "bucket" {}

resource "garage_bucket" "bucket-with-website" {
  website_access_enabled        = true
  website_config_index_document = "index.html"
  website_config_error_document = "error.html"
}

resource "garage_bucket" "bucket-with-quota" {
  quota_max_size    = 1024
  quota_max_objects = 100
}
