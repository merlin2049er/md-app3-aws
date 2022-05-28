# frozen_string_literal: true

json.extract! photo, :id, :uri, :enabled, :product_id, :created_at, :updated_at
json.url photo_url(photo, format: :json)
