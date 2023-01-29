data "terraform_remote_state" "gateway_primary_azure" {
  backend = "remote"
  
  config = {
    hostname = "hostname"
    organization = ""
    workspace = {
      name = "TFEworkspacename"
    }
  }
}
