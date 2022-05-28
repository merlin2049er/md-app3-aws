# frozen_string_literal: true

json.extract! product, :id, :draft, :active, :title, :template, :price, :msrp, :startdate, :endate, :funded, :picurl, :qty, :length, :width, :height, :weight, :courier, :courierurl, :created_at, :updated_at
json.url product_url(product, format: :json)
