oauth_client = Osso::Models::OauthClient.create!(
  name: 'Production',
  identifier: 'production'
)

Osso::Models::EnterpriseAccount.create!(
  name: 'SaaS Co Customer',
  domain: 'example.com',
  oauth_client: oauth_client,
)

Osso::Models::AppConfig.create!(
  name: 'SaaS App',
  contact_email: 'help@saasapp.com',
  logo_url: 'https://avatars1.githubusercontent.com/u/62798259?s=400&u=7df069faddffb0ef6b52d015a7dba4e61a01dab7&v=4'
)

admin = Osso::Models::Account.create!(
  email: 'admin@saas.co',
  status_id: 2,
  role: 'admin',
)