resource "garage_key" "key" {
  name = "key"
}

resource "garage_bucket" "bucket" {}

resource "garage_bucket_local_alias" "bucket_key_private-files" {
  bucket_id     = garage_bucket.bucket.id
  access_key_id = garage_key.key.access_key_id
  alias         = "private-files"
}
