module RedisConstantHelper
  module_function

  def redis_url
    "redis://localhost:#{port}/#{db_number}"
  end

  def db_number
    # Returns a number between 2 and n.
    # Redis db#1 is used for development.

    db_number = 1

    if rails_env == 'test'
      normalized_test_number = [ENV['TEST_ENV_NUMBER'].to_i, 1].max
      db_number += normalized_test_number
    end

    db_number
  end

  def port
    case rails_env
    when 'staging'
      # <staging_port>
    when 'production'
      # <production_port>
    else
      6379 # default Redis port
    end
  end

  def rails_env
    defined?(Rails) ? Rails.env : ENV['RAILS_ENV']
  end
end

REDIS_URL = RedisConstantHelper.redis_url
