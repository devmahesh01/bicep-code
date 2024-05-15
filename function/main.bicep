param pmystg088 string = 'stg099'
param pkind string = 'StorageV2'
param pskuname string = 'Premium_LRS'
param pappplan string= 'myfunplan'


param pmyfunction01 string = 'myapp-fun-01'

module mstg099 'stg.bicep' = {
  name: 'mstg099'
  params: {
    pkind:pkind
    pmystg088:pmystg088
    pskuname:pskuname
  }
  
}
 
module mapplan 'app-plan.bicep' = {
  name:'mapplan01'
  params:{
    pappplan:pappplan
  }
}

module mfunctionapp 'functionapp.bicep' = {
  name:'mfunctionapp'
  params: {
    pmyfunction01:pmyfunction01
    pserverFarmId: mapplan.outputs.appserviceplanId
     pmystg088: pmystg088
     pstorageAccountID:  mstg099.outputs.storageaccountId


  }

  
}

