# frozen_string_literal: true

namespace :db do
  desc 'Erase active storage attachments table in database'
  task erase_active_storage_attachments: :environment do
    require 'populator'

    [ActiveStorageAttachments].each(&:delete_all)
  end
end
