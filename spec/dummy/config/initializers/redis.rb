$redis = Redis.new(url: ENV.fetch('REDIS_URL', "redis://localhost:6379/#{3 + ENV.fetch('TEST_ENV_NUMBER', nil).to_i}"))
