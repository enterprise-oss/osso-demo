module Osso
  class Admin < Roda
    DB = Sequel.postgres(extensions: :activerecord_connection)
    use Rack::Session::Cookie, secret: ENV['SESSION_SECRET']

    plugin :middleware
    plugin :render, engine: 'erb', views: ENV['RODAUTH_VIEWS'] || File.join(File.expand_path(Bundler.root), 'views/rodauth')
    plugin :route_csrf

    plugin :rodauth do
      enable :login, :verify_account
    end

    alias erb render

    route do |r|
      r.rodauth

      def current_account
        Osso::Models::Account.
          first.
          context.
          merge({ rodauth: rodauth })
      end

      r.on 'admin' do
        erb :admin, layout: false
      end

      r.post 'graphql' do
        result = Osso::GraphQL::Schema.execute(
          r.params['query'],
          variables: r.params['variables'],
          context: current_account,
        )

        result.to_json
      end

      env['rodauth'] = rodauth
    end
  end
end
