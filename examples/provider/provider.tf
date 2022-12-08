provider "garage" {
  host   = "127.0.0.1:3903"                                                   # optionally use GARAGE_HOST env var
  scheme = "http"                                                             # optionally use GARAGE_SCHEME env var, https is the default
  token  = "bd6751b4108b4538b1f9f06253aae20b53d63657b22f5fd3e3816faa86e76fb6" # optionally use GARAGE_TOKEN env var
}
