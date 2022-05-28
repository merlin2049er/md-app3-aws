json.extract! poll_option, :id, :poll, :item, :enabled, :poll_url_enabled, :poll_url, :count, :created_at, :updated_at
json.url poll_option_url(poll_option, format: :json)
