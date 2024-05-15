param psqlserver01 string 
param pdatabase01 string 
param padministratorLogin string
@secure()
param padministratorLoginPassword string


resource sqlServer 'Microsoft.Sql/servers@2014-04-01' ={
  name: psqlserver01
  location: resourceGroup().location
  properties: {
    administratorLogin: padministratorLogin
    administratorLoginPassword:padministratorLoginPassword 
  }

}

resource sqlServerDatabase 'Microsoft.Sql/servers/databases@2014-04-01' = {
  parent: sqlServer
  name: pdatabase01
  location: resourceGroup().location
  properties: {
    collation: 'SQL_Latin1_General_CP1_CI_AS'
    edition: 'Basic'
    maxSizeBytes: '34359738368'
    requestedServiceObjectiveName: 'Basic'
  }
}

