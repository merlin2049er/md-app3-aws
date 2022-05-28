# frozen_string_literal: true

json.extract! tax, :id, :prov_id, :tax_rate, :enabled, :comment, :created_at, :updated_at
json.url tax_url(tax, format: :json)
