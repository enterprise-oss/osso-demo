# frozen_string_literal: true

require 'rack/ssl-enforcer'
require 'sinatra/reloader'
require 'sinatra/cors'
require 'osso'
require_relative 'lib/osso/helpers/auth'

class App < Sinatra::Base
  use Rack::SslEnforcer
  set :logging, Logger::DEBUG

  configure :development do
    register Sinatra::Reloader
  end

  register Sinatra::ActiveRecordExtension
  register Sinatra::Cors

  set :allow_origin, '*'
  set :allow_methods, 'GET,HEAD,POST,OPTIONS'
  set :allow_headers, 'content-type,if-modified-since'
  set :expose_headers, 'location,link'
  set :allow_credentials, true
    
  include Osso::AppConfig
  include Osso::Helpers::Auth
  include Osso::RouteMap
  
  get '/' do
    redirect '/admin/enterprise'
  end

  get '/health' do
    'ok'
  end
end
