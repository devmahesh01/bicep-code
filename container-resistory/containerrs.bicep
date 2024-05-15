param pname string = 'myresistory'
resource containerRegistry01 'Microsoft.ContainerRegistry/registries@2021-06-01-preview' = {
  name: pname
  location: resourceGroup().location
  sku: {
    name: 'Basic'
  }
  properties: {
    adminUserEnabled: true
  }
}

