# frozen_string_literal: true

# $redis = Redis.new(url: ENV['REDIS_URL'])

 Redis.new(url:  Rails.application.credentials[:REDIS_URL],
                           port: Rails.application.credentials[:REDIS_PORT],
                           db:   Rails.application.credentials[:REDIS_DB])
