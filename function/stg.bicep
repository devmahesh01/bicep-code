param pmystg088 string = 'stg099'
param pkind string = 'StorageV2'
param pskuname string = 'Premium_LRS'

resource storageaccount01 'Microsoft.Storage/storageAccounts@2021-02-01' = {
  name: pmystg088 

  location: resourceGroup().location
  kind:pkind
  sku: {
    name: pskuname
  }
}

output storageaccountId string = storageaccount01.id
