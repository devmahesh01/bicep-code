using 'devpara' /*TODO: Provide a path to a bicep template*/

param psqlserver01 = 'sql-us-dev-01'

param pdatabase01 = 'db-us-dev-01'

param pappplan01 = 'app-plan-us-dev-01'

param pweapp01 = 'web-app-us-dev-01'

param appinght01 = 'insight-us-dev-01'

param padministratorLogin = 'azureadmin01'

param padministratorLoginPassword = ? /*KeyVault references are not supported in Bicep Parameters files*/
