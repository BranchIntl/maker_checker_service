# frozen_string_literal: true

require_relative 'lib/gem_template/version'

Gem::Specification.new do |spec|
  spec.name = 'gem_template'
  spec.version = GemTemplate::VERSION
  spec.authors = ['Branch International']
  spec.email = ['engineering@branch.co']

  spec.summary = 'Implementation of gem_template gem'
  spec.description = ''
  spec.homepage = 'https://branch.co'
  spec.required_ruby_version = '>= 3.2.0'
  spec.license = 'All rights reserved.'

  spec.metadata['allowed_push_host'] = ''
  spec.metadata['rubygems_mfa_required'] = 'true'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    # spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise 'RubyGems 2.0 or newer is required to protect against public gem pushes.'
  end

  spec.require_paths = ['lib']

  spec.add_dependency 'active_service', '~> 3.0' # Private gem!
end
