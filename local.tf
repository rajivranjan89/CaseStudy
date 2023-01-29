locals { 
  subnet_id = data.terraform_remote_state.gateway_primary_azure.outputs.subnet_id
  nsg_id = data.terraform_remote_state.gateway_primary_azure.outputs.nsg_id
  nsg_name = data.terraform_remote_state.gateway_primary_azure.outputs.testnsg_name
}
