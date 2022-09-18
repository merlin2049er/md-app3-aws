# frozen_string_literal: true

namespace :db do
  desc 'Erase action text rich text table in database'
  task erase_action_text_rich_text: :environment do
    require 'populator'
         Product.all.each do |p|
p.body = 'sss'
p.save
	end


  end
end
