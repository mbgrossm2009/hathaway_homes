require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module HathawayHomes
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    moesif_options = {
      'application_id' => 'eyJhcHAiOiIxMzI6MTA1IiwidmVyIjoiMi4wIiwib3JnIjoiNTg2OjY4IiwiaWF0IjoxNTQxNDYyNDAwfQ.0fs360xIyZrVRHyn43DyGYMvfosKmLG0--M0_9dayuM'
    }

    config.middleware.use "MoesifRack::MoesifMiddleware", moesif_options
  end
end
