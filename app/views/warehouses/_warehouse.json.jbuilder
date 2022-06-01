json.extract! warehouse, :id, :name, :address1, :address2, :city, :prov, :postalcode, :created_at, :updated_at
json.url warehouse_url(warehouse, format: :json)
