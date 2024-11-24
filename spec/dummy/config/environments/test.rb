require 'active_support/core_ext/integer/time'

# The test environment is used exclusively to run your application's
# test suite. You never need to work with it otherwise. Remember that
# your test database is "scratch space" for the test suite and is wiped
# and recreated between test runs. Don't rely on the data there!

Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # While tests run files are not watched, reloading is not necessary.
  config.enable_reloading = false

  # This is set to true so that the timings on the tests are correct. Otherwise,
  # the application loading can cause a single test to incorrectly present a
  # large run time.
  config.eager_load = false

  # Configure public file server for tests with Cache-Control for performance.
  config.public_file_server.enabled = true
  config.public_file_server.headers = {
    'Cache-Control' => "public, max-age=#{1.hour.to_i}",
  }

  # Show full error reports and disable caching.
  config.consider_all_requests_local = true
  config.action_controller.perform_caching = false
  config.cache_store = :null_store

  # Render exception templates for rescuable exceptions and raise for other exceptions.
  config.action_dispatch.show_exceptions = :rescuable

  # Disable request forgery protection in test environment.
  config.action_controller.allow_forgery_protection = false

  # Print deprecation notices to the stderr.
  config.active_support.deprecation = :stderr

  # Raise exceptions for disallowed deprecations.
  config.active_support.disallowed_deprecation = :raise

  # Tell Active Support which deprecation messages to disallow.
  config.active_support.disallowed_deprecation_warnings = []

  # Raises error for missing translations.
  # config.i18n.raise_on_missing_translations = true

  # Annotate rendered view with file names.
  # config.action_view.annotate_rendered_view_with_filenames = true

  # Raise error when a before_action's only/except options reference missing actions
  config.action_controller.raise_on_missing_callback_actions = true

  # Load factories from the /spec/factories, otherwise FactoryBot will look for
  # them in spec/dummy/spec/factories.
  config.factory_bot.definition_file_paths = ['../factories']

  # Configure Active Job to use the test adapter.
  config.active_job.queue_adapter = :test

  if ENV['LOG_LEVEL'].present?
    config.logger = ActiveSupport::Logger.new($stdout)
    config.logger.level =
      if ENV['LOG_LEVEL'].casecmp?('debug')
        config.active_record.verbose_query_logs = false # Use the ActiveRecordQueryTrace gem instead
        ActiveRecordQueryTrace.enabled = true
        Logger::DEBUG
      elsif ENV['LOG_LEVEL'].casecmp?('info')
        config.logger.level = Logger::INFO
      else
        config.logger.level = Logger::WARN
      end
  end
end
