json.extract! search_for, :id, :searchterm, :created_at, :updated_at
json.url search_for_url(search_for, format: :json)
