require 'posthog-ruby'

class Analytics
  def initialize
    @posthog ||= PostHog::Client.new({
      api_key: ENV['POSTHOG_API_KEY'],
      api_host: ENV['POSTHOG_HOST'],
    })
  end

  def self.jwt_login(payload)
    self.capture(
      distinct_id: payload[:email],
      event: 'admin signed-in',
      properties: payload,
    )
  end

  def self.identify(**args)
    new.identify(**args)
  end

  def self.capture(**args)
    new.capture(**args)
  end

  def identify(distinct_id:, properties: {})
    @posthog.identify({
      distinct_id: distinct_id
    })
  end

  def capture(distinct_id:, event:, properties: {})
    posthog.capture({
      distinct_id: distinct_id,
      event: event,
      properties: properties
    })
  end
end