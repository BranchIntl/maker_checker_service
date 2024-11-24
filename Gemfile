# frozen_string_literal: true

source 'https://rubygems.org'

ruby '3.2.2'

gemspec

# PERMISSIONS & SECURITY
# ---------------------------
gem 'brakeman', require: false

# CODE QUALITY
# ---------------------------
gem 'annotate', require: false, group: :development # Puts model schema at the top of model files
gem 'branch_rubocop', git: 'https://github.com/BranchIntl/branch_rubocop.git', branch: 'main', require: false, group: %i[development test] # Rubocop configs for Branch

# TESTING
# ---------------------------
gem 'active_record_query_trace', group: %i[development test]
gem 'database_query_matchers', git: 'https://github.com/BranchIntl/database_query_matchers.git', tag: 'v1.0.0', group: :test
gem 'factory_bot_rails', group: :test
gem 'fakeredis', '>=0.9.2', group: :test, require: 'fakeredis/rspec'
gem 'guard', require: false, group: :development
gem 'guard-shell', require: false, group: :development
gem 'parallel_tests', group: :test, require: false
gem 'pg', group: %i[development test] # Used in the dummy app
gem 'rails', '>= 7.0', group: :test # Dummy app requires Rails
gem 'redis', group: %i[development test]
gem 'rspec_junit_formatter', group: :test # This is required for CircleCI to analyze test performance
gem 'rspec-rails', group: :test
gem 'rspec-tracer', git: 'https://github.com/avmnu-sng/rspec-tracer.git', ref: '568c5e763385187d50b16ff1a95a859f9f288d20', require: false, group: :test
gem 'timecop', group: :test

# DEBUGGING
# ---------------------------
gem 'byebug', group: :development
gem 'debug', group: :development
gem 'pry-byebug', group: %i[development test] # rspec-tracer secretly requires pry.
gem 'ruby-lsp-rspec', require: false, group: :development

# PROFILING
# ---------------------------
gem 'memory_profiler', group: :development, require: false
gem 'ruby-prof', group: :development, require: false
gem 'stackprof', group: :development, require: false
gem 'test-prof', group: %i[development test], require: false
gem 'vernier', group: :development, require: false

# UTILITIES
# ---------------------------
gem 'active_service', git: 'https://github.com/BranchIntl/active_service.git', branch: 'main'
gem 'bootsnap', require: false
