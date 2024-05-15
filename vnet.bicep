resource virtualNetworknew 'Microsoft.Network/virtualNetworks@2019-11-01' = {
  name: 'myvnet'
  location: 'west us'
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.0.0.0/16'
      ]
    }
    subnets: [
      {
        name: 'Sub01'
        properties: {
          addressPrefix: '10.0.1.0/24'
        }
      }
      {
        name: 'Sub02'
        properties: {
          addressPrefix: '10.0.2.0/26'
        }
      }
    ]
  }
}

