param appinght01 string  = ''

resource appInsightsComponents 'Microsoft.Insights/components@2020-02-02' = {
  name: appinght01
  location: 'west us'
  kind: 'web'
  properties: {
    Application_Type: 'web'
  }
}

