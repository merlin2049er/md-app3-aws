# frozen_string_literal: true

json.extract! feedback, :id, :rate, :recommned, :comment, :category_id, :created_at, :updated_at
json.url feedback_url(feedback, format: :json)
