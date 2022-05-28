# frozen_string_literal: true

namespace :db do
  desc 'Erase active storage blobs table in database'
  task erase_active_storage_blobs: :environment do
    require 'populator'

    [ActiveStorageBlobs].each(&:delete_all)
  end
end
