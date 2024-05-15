param penv string = 'dev'
param psku string = (penv == 'dev') ? 'F1': 'S2'
param pcapacity int=(penv == 'dev') ? 5: 12
param psqlserver01 string 
param pdatabase01 string 
param pappplan01 string 
param pweapp01 string 
param  appinght01 string 
param padministratorLogin string
@secure()
param padministratorLoginPassword string

 


module winapp01 'condtion.bicep' = {
  name: 'web-ue-app-01'
  params: {
    pappplan01: pappplan01
     pweapp01: pweapp01
     pcapacity: pcapacity
     psku: psku
     penv: penv
  }
}




module dbqsl 'condion-sql.bicep' = {
  name: 'mydb01'
  params: {
     pdatabase01: pdatabase01
      psqlserver01: psqlserver01
      padministratorLogin: padministratorLogin
      padministratorLoginPassword: padministratorLoginPassword
  }
}
 
module maapinsight 'appinsight.bicep' = {
  name: 'ingight-us-01'
  params: {
    appinght01 :  appinght01
}
}
