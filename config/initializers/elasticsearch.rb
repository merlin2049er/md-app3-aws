# frozen_string_literal: true

config = {
  host:
    'https://paas:f49902c6629cd3282b0d3b86c1610c65@oin-us-east-1.searchly.com',
  transport_options: { request: { timeout: 5 } }
}

if File.exist?('config/elasticsearch.yml')
  config.merge!(
    YAML.load_file('config/elasticsearch.yml')[Rails.env].deep_symbolize_keys
  )
end

Elasticsearch::Model.client = Elasticsearch::Client.new(config)
