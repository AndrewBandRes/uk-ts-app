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

    # Initialize configuration settings from yml file via configliere
    Settings.read(Rails.root.join('config', 'settings.yml')) if Rails.root.join('config', 'settings.yml').exist?
    Settings.defaults Settings.extract!(Rails.env)[Rails.env] || {}
    Settings.extract!(:test, :development, :production)

    config.action_mailer.default_url_options = { host: Settings['app.host'] }
    config.action_mailer.delivery_method = :smtp
    config.action_mailer.perform_deliveries = true
    config.action_mailer.raise_delivery_errors = true
    config.action_mailer.default charset: 'utf-8'

    config.action_mailer.smtp_settings = {
      address: Settings['devise.address'],
      port: Settings['devise.port'],
      domain: Settings['devise.domain'],
      user_name: Settings['devise.user_name'],
      password: Settings['devise.password'],
      authentication: 'plain',
      enable_starttls_auto: true
    }
  end
end
