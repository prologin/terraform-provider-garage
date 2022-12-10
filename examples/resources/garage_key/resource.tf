resource "garage_key" "key" {
  name = "key"
  permissions = {
    create_bucket = true // defaults to false
  }
}
