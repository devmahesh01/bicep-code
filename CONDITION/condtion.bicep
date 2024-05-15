param pappplan01 string 
param pweapp01 string 
@description('PL CHOOSE BELOW SKU')
@allowed(['F1','S1','S2','B1','B2'])
param psku string
@minValue(5)
@maxValue(35)
param pcapacity int
param penv string

resource webslots 'Microsoft.Web/sites/slots@2023-12-01'=   if (penv == 'dev') {
  name: 'webslots01'
  location : resourceGroup().location
  parent:  webApplicationwin
  properties: {
    serverFarmId: appServicePlanwin.id
  }
  
}

resource appServicePlanwin 'Microsoft.Web/serverfarms@2020-12-01' = {
  name: pappplan01
  location: 'west us'
  sku: {
    name: psku
    capacity:pcapacity
    
  }
}
resource webApplicationwin 'Microsoft.Web/sites@2021-01-15' = {
  name: pweapp01
  location: 'west us'
  
  properties: {
    serverFarmId: resourceId('Microsoft.Web/serverfarms' , 'app-plan-win')
  }
}

