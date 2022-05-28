# frozen_string_literal: true

namespace :db do
  desc 'Fill action text rich text table in database'
  task fill_action_text_rich_text: :environment do
    require 'populator'

    Product.all.each do |i|
      ActionTextRichTexts.create(
        name: 'body',
        body: Populator.words(1..45),
        record_type: 'Product',
        record_id: i.id,
        created_at: Time.now,
        updated_at: Time.now
      )
    end
  end
end
