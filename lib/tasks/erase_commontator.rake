# frozen_string_literal: true

namespace :db do
  desc 'Erase commontator tables in database'
  task erase_commontator: :environment do
    require 'populator'

    [CommontatorComments].each(&:delete_all)
    [CommontatorSubscriptions].each(&:delete_all)
    [CommontatorThreads].each(&:delete_all)
  end
end
