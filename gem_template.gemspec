# frozen_string_literal: true

require_relative 'lib/version'

Gem::Specification.new do |spec|
  spec.name = 'maker_checker_service'
  spec.version = MakerCheckerService::VERSION
  spec.authors = ['Branch International']
  spec.email = ['engineering@branch.co']

  spec.summary = 'Adds a maker_checker service for approving and denying requests.'
  spec.description = ''
  spec.homepage = 'https://branch.co'
  spec.required_ruby_version = '>= 3.2.2'

  spec.metadata['allowed_push_host'] = ''
  spec.metadata['rubygems_mfa_required'] = 'true'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  # rubocop:disable BestPractices/NoSingleLetterVariablesInMultilineBlocks: is this spec.files needed? Does the gem need to export its specs and bin?
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git appveyor Gemfile])
    end
  end
  # rubocop:enable BestPractices/NoSingleLetterVariablesInMultilineBlocks

  spec.require_paths = ['lib']
  spec.add_dependency 'i18n', '~> 1.14'
  spec.add_dependency 'rails', '>= 7'

  spec.add_dependency 'active_service', '~> 3.0' # Private gem!
end