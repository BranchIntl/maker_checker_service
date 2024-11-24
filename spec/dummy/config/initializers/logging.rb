Rails.application.config.after_initialize do
  # By default the dummy application will filter the gem's logs, so we update it
  # to include them.
  Rails.backtrace_cleaner.remove_silencers!
  Rails.backtrace_cleaner.add_silencer { |line| !line.include?('gem_template') }

  ActiveRecordQueryTrace.level = :custom
  ActiveRecordQueryTrace.colorize = :brown
  ActiveRecordQueryTrace.backtrace_cleaner = Rails::BacktraceCleaner.new.tap do |backtrace_cleaner|
    backtrace_cleaner.remove_filters!
    backtrace_cleaner.remove_silencers!
    backtrace_cleaner.add_silencer { |line| !line.include?('gem_template') }
  end
end
