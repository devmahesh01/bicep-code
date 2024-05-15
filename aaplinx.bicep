resource appServicePlanlinux 'Microsoft.Web/serverfarms@2020-12-01' = {
  name: 'aap-linux-plan'
  location: 'west us'
  kind:'linux'
  properties: {
    reserved: true
  }
  sku: {
    name: 'F1'
    capacity: 1
  }
}

