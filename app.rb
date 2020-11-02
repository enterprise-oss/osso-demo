# frozen_string_literal: true

require 'sinatra/reloader'
require 'osso'
require_relative 'lib/osso/helpers/auth'
require_relative 'lib/analytics' unless ENV['POSTHOG_API_KEY'].nil?

class App < Sinatra::Base
  include Osso::AppConfig
  include Osso::Helpers::Auth
  include Osso::RouteMap

  register Sinatra::ActiveRecordExtension

  get '/' do
    begin
      1 / 0
    rescue ZeroDivisionError => exception
      Raven.capture_exception(exception) if defined?(Raven)
    end
    redirect '/admin/enterprise'
  end

  get '/health' do
    'ok'
  end
end
