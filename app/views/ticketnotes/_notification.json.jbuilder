# frozen_string_literal: true

json.extract! notification, :id, :notify_msg, :enabled, :user_id, :created_at, :updated_at
json.url notification_url(notification, format: :json)
