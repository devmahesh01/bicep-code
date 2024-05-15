param pname string = 'vm01'
param plocation string = resourceGroup().location
param pstaringindex int = 1
param pcountindex int =2




resource linuxvm01 'Microsoft.Compute/virtualMachines@2020-12-01' = [for index in range(pstaringindex , pcountindex) : {

  name: '${pname}-${index}'
  location: plocation
  properties: {
    hardwareProfile: {
      vmSize: 'Standard_A2_v2'
    }
    osProfile: {
      computerName: 'mypc'
      adminUsername: 'azureadmin01'
      adminPassword: 'admin@123456'
    }
    storageProfile: {
      imageReference: {
        publisher: 'Canonical'
        offer: 'UbuntuServer'
        sku: '16.04-LTS'
        version: 'latest'
      }
      osDisk: {
        name: 'name'
        caching: 'ReadWrite'
        createOption: 'FromImage'
      }
    }
    networkProfile: {
      networkInterfaces: [
        {
          id: '/subscriptions/82be3273-0cca-49d1-86d1-1db6c7a3c960/resourceGroups/jairg/providers/Microsoft.Network/networkInterfaces/mynic'
        }
      ]
    }
    diagnosticsProfile: {
      bootDiagnostics: {
        enabled: true
        storageUri: 'https://stg99007.blob.core.windows.net'
      }
    }
  }
}
]
