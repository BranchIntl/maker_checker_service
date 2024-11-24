ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('dummy/config/environment', __dir__)
require 'rspec/rails'
require 'factory_bot_rails'
require 'test_prof/recipes/rspec/let_it_be'

TestProf::LetItBe.configure do |config|
  config.default_modifiers[:reload] = true
end

if ENV.fetch('CIRCLECI', 'false').casecmp?('true')
  # In CircleCI, load the test schema since an earlier step will have run rails
  # db:migrate to update schema.rb or structure.sql.
  ActiveRecord::Migration.maintain_test_schema!
else
  # Create the test database if needed.
  begin
    ActiveRecord::Base.connection.connect!
  rescue StandardError
    ActiveRecord::Tasks::DatabaseTasks.create_current
  end

  # Run any missing migrations. We do this instead of calling
  # `ActiveRecord::Migration.maintain_test_schema!` because the test rails app is
  # a dummy app so likely the migrations haven't been run manually (meaning
  # schema.rb or structure.sql are likely out of date).
  ActiveRecord::MigrationContext.new(File.expand_path('dummy/db/migrate', __dir__)).migrate
end

RSpec.configure do |config|
  config.use_transactional_fixtures = true

  # Include ActiveJob::TestHelper in all tests
  config.include ActiveJob::TestHelper

  config.before(:each) { $redis.flushdb }
end
