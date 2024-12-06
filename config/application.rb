require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module UkTsApp
  class Application < Rails::Application
    config.load_defaults 7.0

    config.autoload_paths += Dir[Rails.root.join('app', 'models', '**/')]
    config.eager_load_paths << Rails.root.join('lib')

    config.i18n.default_locale = :ru
    config.time_zone = 'Krasnoyarsk'
    config.middleware.insert 0, Rack::UTF8Sanitizer

    config.active_record.belongs_to_required_by_default = false
    config.active_record.yaml_column_permitted_classes = [Symbol, Time, Date]
  end
end
