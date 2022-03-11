require 'redis'
require_relative '../constants/redis'

Redis.current = Redis.new(url: REDIS_URL)
