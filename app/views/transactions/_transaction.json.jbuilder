# frozen_string_literal: true

json.extract! transaction, :id, :transaction_msg, :user_id, :shipped, :invoice_number, :tracking_number, :postal_carrier, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
