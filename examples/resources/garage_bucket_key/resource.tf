resource "garage_key" "key" {
  name = "my_key"
}

resource "garage_bucket" "bucket" {}

resource "garage_bucket_key" "bucket_key_read-only" {
  bucket_id     = garage_bucket.bucket.id
  access_key_id = garage_key.key.acccess_key_id
  read          = true
}
