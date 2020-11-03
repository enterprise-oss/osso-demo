oauth_client = Osso::Models::OauthClient.create!(
  name: 'Production',
  identifier: 'production'
)

Osso::Models::EnterpriseAccount.create!(
  name: 'SaaS Co Customer',
  domain: 'example.com',
  oauth_client: oauth_client,
)

<<<<<<< HEAD
Osso::Models::AppConfig.create!(
  name: 'SaaS App',
  contact_email: 'help@saasapp.com',
  logo_url: 'https://avatars1.githubusercontent.com/u/62798259?s=400&u=7df069faddffb0ef6b52d015a7dba4e61a01dab7&v=4'
)
=======
admin = Osso::Models::Account.create!(
  email: 'admin@saas.co',
  status_id: 2,
  role: 'admin',
)

ActiveRecord::Base.connection.execute(
  <<~SQL
    INSERT INTO account_password_hashes(id, password_hash) 
    VALUES (#{"'" + admin.id + "'"}, #{"'" + BCrypt::Password.create("password", cost: BCrypt::Engine::MIN_COST).to_s + "'"});
  SQL
)

base = Osso::Models::Account.create!(
  email: 'basic@saas.co',
  status_id: 2,
  role: 'internal',
  oauth_client_id: oauth_client.identifier,
)

ActiveRecord::Base.connection.execute(
  <<~SQL
    INSERT INTO account_password_hashes(id, password_hash) 
    VALUES (#{"'" + base.id + "'"}, #{"'" + BCrypt::Password.create("password", cost: BCrypt::Engine::MIN_COST).to_s + "'"});
  SQL
)

>>>>>>> 3bd8c758ee9d9b5fee2fe5a9a616b676281b19c9
