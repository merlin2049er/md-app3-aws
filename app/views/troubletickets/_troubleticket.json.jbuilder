# frozen_string_literal: true

json.extract! troubleticket, :id, :user_id, :status, :campaign, :subject, :message, :created_at, :updated_at
json.url troubleticket_url(troubleticket, format: :json)
