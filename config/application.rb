require_relative "boot"

require "rails/all"
require 'time'
require 'nokogiri'
require 'haversine'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

#Rails.autoloaders.main.ignore(Rails.root.join('pkg-configs'))


module DoahApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    #timezone setup
    config.time_zone = 'Eastern Time (US & Canada)' # Your local time zone
    config.active_record.default_timezone = :local
    config.active_record.time_zone_aware_attributes = false

    #tell Zeitwerk to ignore node_modules folder from tailwind installation
    #Zeitwerk is an efficient and thread-safe code loader for Ruby
    Rails.autoloaders.main.ignore(Rails.root.join('app/node_modules'))

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
