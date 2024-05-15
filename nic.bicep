resource networkInterface 'Microsoft.Network/networkInterfaces@2020-11-01' = {
  name: 'newnic'
  location: 'west us'
  properties: {
    ipConfigurations: [
      {
        name: 'nicpip'
        properties: {
          privateIPAllocationMethod: 'Dynamic'
          subnet: {
            id: '/subscriptions/82be3273-0cca-49d1-86d1-1db6c7a3c960/resourceGroups/jairg/providers/Microsoft.Network/virtualNetworks/myvnet/subnets/Sub02'
          }
        }
      }
    ]
  }
}

