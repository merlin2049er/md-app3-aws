# frozen_string_literal: true

json.extract! contact, :id, :name, :email, :message, :registered_user, :supplier, :created_at, :updated_at
json.url contact_url(contact, format: :json)
