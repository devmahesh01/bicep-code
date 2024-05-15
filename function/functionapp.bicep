param pserverFarmId string 

param pmyfunction01 string

param pstorageAccountID string
param pmystg088 string

resource azureFunction01 'Microsoft.Web/sites@2020-12-01' = {
  name: pmyfunction01
  location: resourceGroup().location
  kind: 'functionapp'
  properties: {
    serverFarmId: pserverFarmId
    siteConfig: {
      appSettings: [
        {
          name: 'AzureWebJobsDashboard'
         
          value: 'DefaultEndpointsProtocol=https;AccountName=${pmystg088};AccountKey=${listKeys('pstorageAccountID', '2024-04-01').keys[0].value}'
        }
        {
          name: 'AzureWebJobsStorage'
          
          value: 'DefaultEndpointsProtocol=https;AccountName=${pmystg088};AccountKey=${listKeys('pstorageAccountID', '2024-04-01').keys[0].value}'
        }
        {
          name: 'WEBSITE_CONTENTAZUREFILECONNECTIONSTRING'
          
          value: 'DefaultEndpointsProtocol=https;AccountName=${pmystg088};AccountKey=${listKeys('pstorageAccountID', '2024-04-01').keys[0].value}'
        }
        {
          name: 'WEBSITE_CONTENTSHARE'
          value: toLower(pmyfunction01)
        }
        {
          name: 'FUNCTIONS_EXTENSION_VERSION'
          value: '~2'
        }
        {
          name: 'APPINSIGHTS_INSTRUMENTATIONKEY'
          value: 'ecb3f210-d4bb-4103-ab7b-d202ca039e95'
          // value: reference('InstrumentattionId', '2015-05-01').InstrumentationKey
        }
        {
          name: 'FUNCTIONS_WORKER_RUNTIME'
          value: 'dotnet'
        }
      ]
    }
  }
}

