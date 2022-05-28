# frozen_string_literal: true

class Feedback < ApplicationRecord
  has_one :transactions, class_name: 'Transaction', foreign_key: :transaction_id
  validates_uniqueness_of :transaction_id
end
