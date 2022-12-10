resource "garage_bucket" "website" {}

resource "garage_bucket_global_alias" "website" {
  bucket_id = garage_bucket.website.id
  alias     = "website"
}

resource "garage_bucket_global_alias" "www" {
  bucket_id = garage_bucket.website.id
  alias     = "www"
}
