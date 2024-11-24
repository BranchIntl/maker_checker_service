require 'rails/railtie'
require_relative 'configuration'

module GemTemplate
  class Railtie < Rails::Railtie
    # This allows accessing gem configuration (if needed) in a Rails
    # application.rb or environment file (like development.rb). For example,
    # ```
    # config.gem_template.print_prefix = 'foo'
    # ```
    config.gem_template = GemTemplate.configure

    initializer 'gem_template.load_i18n_locales' do |app|
      app.config.i18n.load_path += Dir["#{__dir__}/../../config/locales/**/*.yml"]
    end
  end
end
