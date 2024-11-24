guard :shell, all_on_start: true do
  watch(%r{^(app|lib|config)/|^spec/(?!examples.txt|dummy/tmp|dummy/log)}) do |_|
    system('PARALLEL_TEST_PROCESSORS=5 bundle exec parallel_rspec')
  end
end
