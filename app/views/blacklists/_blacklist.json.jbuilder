# frozen_string_literal: true

json.extract! blacklist, :id, :email, :comment, :created_at, :updated_at
json.url blacklist_url(blacklist, format: :json)
