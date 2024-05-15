param pappplan string= 'myfunplan'

resource appServicePlanwin 'Microsoft.Web/serverfarms@2020-12-01' = {
  name: pappplan
  location: 'west us'
  sku: {
    name: 'S1'
    capacity: 1
  }
}
output appserviceplanId string = appServicePlanwin.id
