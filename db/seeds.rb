oauth_client = Osso::Models::OauthClient.create!(
  name: 'Production',
  identifier: 'production'
)

Osso::Models::EnterpriseAccount.create!(
  name: 'SaaS Co Customer',
  domain: 'customer.com',
  oauth_client: oauth_client,
)

example = Osso::Models::EnterpriseAccount.create!(
  name: 'Example Customer',
  domain: 'example.com',
  oauth_client: oauth_client,
)

Osso::Models::IdentityProvider.create!(
  enterprise_account: example,
  oauth_client: oauth_client,
  domain: 'example.com',
  service: 'OKTA',
  status: 'PENDING'
)