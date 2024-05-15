resource sqlServer 'Microsoft.Sql/servers@2021-02-01-preview' = {
  name: 'mysqlserver0q1'
  location: resourceGroup().location
  properties: {
    administratorLogin: 'sqladmin01'
    administratorLoginPassword: 'admin@123456'
  }
}

resource sqlServerFirewallRules 'Microsoft.Sql/servers/firewallRules@2021-02-01-preview' = {
  parent: sqlServer
  name: 'sqlrule01'
  properties: {
    startIpAddress: '172.185.0.5'
    endIpAddress: '172.185.0.5'
  }
}

