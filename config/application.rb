require_relative "boot"

require "rails/all"
Bundler.require(*Rails.groups)

module BookPublisher
  class Application < Rails::Application
    config.load_defaults 5.1
    config.active_job.queue_adapter = :delayed_job
    config.generators do |g|
      g.fixture_replacement :factory_bot, dir: "spec/factories"
    end
  end
end
