# frozen_string_literal: true

require 'sinatra/reloader'
require 'osso'
require_relative 'lib/osso/admin'
require_relative 'lib/analytics' unless ENV['POSTHOG_API_KEY'].nil?

class App < Sinatra::Base
  include Osso::AppConfig
  include Osso::RouteMap

  register Sinatra::ActiveRecordExtension

  get '/' do
    redirect '/admin/enterprise'
  end

  get '/health' do
    'ok'
  end
end
