# frozen_string_literal: true

class Troubleticket < ApplicationRecord
  belongs_to :user
  has_many :ticketnotes, dependent: :destroy
  accepts_nested_attributes_for :ticketnotes,
                                reject_if: :all_blank, allow_destroy: true

  validates_presence_of :subject
  validates_presence_of :message
end
