param pappplan01 string 
param pweapp01 string 





resource appServicePlanwin 'Microsoft.Web/serverfarms@2020-12-01' = {
  name: pappplan01
  location: 'west us'
  sku: {
    name: 'S1'
    capacity: 1
  }
}
resource webApplicationwin 'Microsoft.Web/sites@2021-01-15' = {
  name: pweapp01
  location: 'west us'
  
  properties: {
    serverFarmId: resourceId('Microsoft.Web/serverfarms' , 'app-plan-win')
  }
}

