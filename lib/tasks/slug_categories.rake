# frozen_string_literal: true

namespace :db do
  desc 'add friendly slugs to categories'
  task slug_category: :environment do
    Category.find_each(&:save)
  end
end
