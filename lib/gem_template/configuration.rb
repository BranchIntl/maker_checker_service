module GemTemplate
  class Configuration
    attr_accessor :print_prefix

    def initialize
      @print_prefix = 'Default prefix '
    end
  end

  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration) if block_given?
    return configuration
  end
end
