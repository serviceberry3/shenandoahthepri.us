require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

#Rails.autoloaders.main.ignore(Rails.root.join('pkg-configs'))


module DoahApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

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
