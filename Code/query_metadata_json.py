# Here is an example of code in Python that queries the metadata of an Azure virtual machine using the azure-sdk-for-python library and returns the data in JSON format

# Please make sure you have the right credentials and subscription id to access the metadata of your azure instance. Also, replace the placeholders 'your-client-id', 'your-client-secret', 'your-tenant-id','your-subscription-id','your-resource-group','your-vm-name' with the appropriate values.
# Also, you may need to install azure-mgmt-compute and azure-common package if you haven't already.

from azure.mgmt.compute import ComputeManagementClient
from azure.common.credentials import ServicePrincipalCredentials
import json

# Set up the credentials
credentials = ServicePrincipalCredentials(
    client_id='your-client-id',
    secret='your-client-secret',
    tenant='your-tenant-id'
)

# Create a ComputeManagementClient
compute_client = ComputeManagementClient(credentials, 'your-subscription-id')

# Get the metadata for the current virtual machine
vm = compute_client.virtual_machines.get(
    'your-resource-group',
    'your-vm-name'
)

# Convert the response to JSON and print it
print(json.dumps(vm.as_dict(), indent=2))



# -------------------------------------------------------

# Instance Metadata service provides information regarding your running virtual machine instances. 
# This information can be used to manage and configure your instances on Azure. 
# Azure's instance metadata service is a RESTful endpoint available to all IaaS VMs created via new Azure Resource Manager. 

### Retrieving instance metadata

Invoke-RestMethod -Headers @{"Metadata"="true"} -Method GET -NoProxy -Uri "http://169.254.169.254/metadata/instance?api-version=2021-02-01" | ConvertTo-Json -Depth 64
