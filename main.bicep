param psqlserver01 string 
param pdatabase01 string 
param pappplan01 string 
param pweapp01 string 
param  appinght01 string 
param padministratorLogin string


resource keyVault01 'Microsoft.KeyVault/vaults@2019-09-01' existing = {
  name: 'sub-eus-eng-01'
}
 


module winapp01 'aap-plan.bicep' = {
  name: 'web-ue-app-01'
  params: {
    pappplan01: pappplan01
     pweapp01: pweapp01
  }
}




module dbqsl 'sqldatabase.bicep' = {
  name: 'mydb01'
  params: {
     pdatabase01: pdatabase01
      psqlserver01: psqlserver01
      padministratorLogin: padministratorLogin
      padministratorLoginPassword: keyVault01.getSecret('administratorLoginPassword')
  }
}
 
module maapinsight 'app-insight.bicep'= {
  name: 'ingight-us-01'
  params: {
    appinght01 :  appinght01
}
}
