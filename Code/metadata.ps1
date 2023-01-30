# Instance Metadata service provides information regarding your running virtual machine instances. 
# This information can be used to manage and configure your instances on Azure. 
# Azure's instance metadata service is a RESTful endpoint available to all IaaS VMs created via new Azure Resource Manager. 

### Retrieving instance metadata

Invoke-RestMethod -Headers @{"Metadata"="true"} -Method GET  -Uri "http://169.254.169.254/metadata/instance?api-version=2021-02-01" | ConvertTo-Json

curl -H Metadata:true http://169.254.169.254/metadata/instance?api-version=2017-03-01
