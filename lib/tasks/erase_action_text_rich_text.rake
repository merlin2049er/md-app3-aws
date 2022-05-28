# frozen_string_literal: true

namespace :db do
  desc 'Erase action text rich text table in database'
  task erase_action_text_rich_text: :environment do
    require 'populator'

    [ActionTextRichTexts].each(&:delete_all)
  end
end
