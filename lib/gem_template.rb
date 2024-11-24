require 'logger'
require 'zeitwerk'

# This Zeitwerk code allows us to automatically load the gem's files without
# explicit `require` statements. However, you have to add the autoload paths,
# and they need to be absolute to guarantee correct resolution.
loader = Zeitwerk::Loader.for_gem
loader.push_dir(File.expand_path('../app/services', __dir__))
loader.setup

require_relative 'gem_template/railtie' if defined?(Rails::Engine)

module GemTemplate
  class << self
    attr_accessor :logger
  end

  self.logger = defined?(Rails) && Rails.respond_to?(:application) ? Rails.logger : Logger.new($stdout)
end
