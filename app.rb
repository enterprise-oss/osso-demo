# frozen_string_literal: true

require 'sinatra/reloader'
require 'osso'
require_relative 'lib/osso/admin'
require_relative 'lib/analytics' unless ENV['POSTHOG_API_KEY'].nil?

class App < Sinatra::Base
  include Osso::AppConfig
  include Osso::Helpers::Auth
  use Osso::Auth
  use Osso::Oauth
  use Osso::Admin

  register Sinatra::ActiveRecordExtension

  get '/' do
    redirect '/admin/enterprise'
  end

  get '/health' do
    'ok'
  end
end
