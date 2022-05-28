# frozen_string_literal: true

namespace :db do
  desc 'add friendly slugs to products'
  task slug_products: :environment do
    Product.find_each(&:save)
  end
end
